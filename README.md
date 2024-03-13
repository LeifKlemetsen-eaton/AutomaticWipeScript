# AutomaticWipeScript
PowerShell script uses REST-API to send camera wipe cmds to HERNIS FLEX system.
# Policy
Set an execution policy to allow PowerShell script execution:<br>
* Open "Windows PowerShell" as administrator<br>
* Example on on policy: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
# Installation
* Make a new folder.<br>
* Copy "StartWiperOnCameras.ps1" to the new folder.
* These customer specific variables needs to be set.
$camerasWithWiper = 30, 39, 47      # Comma seperated list of cameras to wipe<br>
$mstrRestHost     = "Servername"    # Server name or IP address with REST API<br>
$mstrUserName     = ""              # Username<br>
$mstrPassword     = ""              # Password<br>
$tcp              = "444"           # Port for REST API<br>
$mstrRestProtocol = "HTTPS"         # Secure: HTTPS or unsecure: HTTP<br>
# Task Scheduler
Create Basic Task.
# Logging of the REST-API cmds
In HERNIS Watchdog Control:<br>
*Stop REST Module
*Enable logging of all requests
*Start REST Module
REST-API request are stored here:<br>
*C:\HERNIS\Logs\RESTModule
# Example on manual script execution
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/4e44f05e-877f-4f72-902e-e949d43b7f56)
