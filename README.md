# AutomaticWipeScript
PowerShell script uses REST-API to send camera wipe cmds to HERNIS FLEX system.
# Policy
Set an execution policy to allow PowerShell script execution:<br>
* Open "Windows PowerShell" as administrator<br>
* Example on on policy: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
# Installation
* Make a new folder.<br>
* Copy "StartWiperOnCameras.ps1" to the new folder.
* These customer specific variables in the script needs to be set manually.<br>
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/2c1f841e-d99b-46ba-9d99-6b10f3b3f9e0)
# Certification is required for HTTPS
From REST-API server copy this certificate "C:\HERNIS\Configuration\RESTModule\RESTModuleSSLCertificate.cer" to the REST client.<br>
On the REST client open "Manage user certificates" and from "Trusted Root Certification Authorities/Certificates" import the certificate.
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/221d92a2-4c5e-451c-a396-7d80cbf7379f)

# Task Scheduler
Create Basic Task:<br>
Edit Action:<br>
* Program script: The PowerShell it self.<br>
* Argument: The the location and the file "StartWiperOnCameras.ps1".<br>
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/df90eb2d-f75f-4bc0-8da7-2b984f89c0db)
Edit Trigger:<br>
* Example where the script is running daily at a specific time.
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/89e45fca-bb00-43af-9d44-f3baf39a33e9)
# Logging of the REST-API requests
In HERNIS Watchdog Control:<br>
* Stop REST Module
* Enable logging of all requests
* Start REST Module

REST-API request are stored here:
* C:\HERNIS\Logs\RESTModule\RESTModuleLog_202403_0001.xml
# Example on a manual script execution
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/4e44f05e-877f-4f72-902e-e949d43b7f56)
