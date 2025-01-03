local logDir = 'logs' -- Folder Name
local logfile = logDir . . '/errors.txt' -- file

local function createLogDirectoryIfNotExists()
    local result = os.execute('mkdir' . . logDir)
    return true 
end 

local function createLogFileIfNotExists()
    if not createLogFileIfNotExists() then 
        return 
    end 

    local file - io.open(logFile, 'r')
    if file == nil then
        file = io.open(logFile, 'w')
        if file then 
            file:write('Error Logs\n')
            file:close()
        else 
            print("Couldn't create log file")
        end 
    else 
        file:close()
    end 
end 

local function logError(resource, error, player)
    createLogFileIfNotExists()
    local file = io.open(logFile, 'a')
    if file then 
        local time = os.date('%Y-%m-%d  %H:%M:%S') -- year month day, hour minute second
        file:write(('[%s] Error in resouces %s by player %s: %s\n'):format(time,resource,player,error)) -- %s = formattable
        file:close ()
    else
        print('Couldnt open log file')
    end
end 

local function logErrorDiscord(webhook, resource,error,player)
    local webhook_url = webhook
    local webhook_user = "MP Error Collection"
    local webhook_avatar_url = -- "whatever URL your Using"
    local time = os.date('%Y-%m-%d  %H:%M:%S') -- year month day, hour minute second
    local description = ('Error in resouces **%s** by player **%s**: %s\n'):format(time,resource,player,error)

    local payload = {
        username = webhook_user,
        avatar_url = webhook_avatar_url,
        embeds = {{
            tiitle = "Error iin resource: " ..resource,
            color = 16777215, -- red iimbed color
            timestamp = time
        }}
    }

    PerformHttpRequest(webhook_url, function(err,text,headers)
        if err ~= 200 then
            print("failed to send webhook")
        end
    end, 'POST', json.encode(payload), {['Content-Type'] = 'application/json'})
end

RegisterServerEvent('logError')
AddEventHandler('logError', function (use, webhook,resource,error)
    if not webhook then use = false end
    local player = source 
    if use then 
            logErrorDiscord(webhook, resource,error, GetPlayerName(player))
    else
        print('Error found in resource == ' .. resource .. " See Logs Folder or Discord")
end)

