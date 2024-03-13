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
'$camerasWithWiper = 30, 39, 47      # Comma seperated list of cameras to wipe<br>
$mstrRestHost     = "Servername"    # Server name or IP address with REST API<br>
$mstrUserName     = ""              # Username<br>
$mstrPassword     = ""              # Password<br>
$tcp              = "444"           # Port for REST API<br>
$mstrRestProtocol = "HTTPS"         # Secure: HTTPS or unsecure: HTTP'<br>
# Task Scheduler
Create Basic Task.



