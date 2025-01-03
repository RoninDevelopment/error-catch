FiveM Server Script Error Catcher
This is a lightweight FiveM script designed to catch and display server script errors directly in the F8 console. It simplifies the debugging process by allowing developers and server administrators to monitor errors in real-time without relying on external log files.

Features
Real-time error capture displayed via the F8 menu.
Simplifies troubleshooting for server-side issues.
Easy integration into any FiveM server.
Improves debugging efficiency for developers.
Installation
Download or clone this repository to your server's resource folder:

bash
Copy code
git clone https://github.com/YourUsername/YourRepoName.git
Add the resource to your server.cfg file:

plaintext
Copy code
ensure [resource-name]
Replace [resource-name] with the folder name of the script.

Restart your server or use the refresh and start [resource-name] commands in the server console.

Usage
Start your FiveM client and connect to your server.
Press the F8 key to open the console.
Any server script errors will be displayed in the console for easy debugging.
Contributing
Feel free to open issues or submit pull requests to improve the functionality or performance of the script.
