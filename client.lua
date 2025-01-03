MLog = {}

MLog.Terms = {"error", "not", "failed", "invalid, "cannot", "attempt", "typeerror", "function"}
MLog.WebhookURL = "discordwebhooklink"
MLog.EmbedColor = 16711680
MLog.UseDsicord = false
Mlog.EnableLogging = true

if MLog.EnableLogging then
    pring("MP Error Catching Live")
end

error = function(msg)
    TriggerServerEvent('logError', Mlog.useDiscord, MLog.WebhookURL, GetCurrentResourceName(), msg)
    if Mlog.EnableLogging then
        print("Error from" .. GetCurrentResourceName() .. "sent and logged, please make a ticket!")
    end
end


Citizen.Trace = function(msg)
    for _, term in ipairs(Mlog.Terms) do 
        if string.find(msg, term) then
            error(msg)
        end
    end
end
