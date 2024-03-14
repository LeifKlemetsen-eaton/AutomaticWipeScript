# AutomaticWipeScript
PowerShell script uses REST-API to send camera wipe cmds to HERNIS FLEX system.
## Policy
Set an execution policy to allow PowerShell script execution:<br>
* Open "Windows PowerShell" as administrator<br>
* Example on policy: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
## Installation
* Make a new folder.<br>
* Copy "StartWiperOnCameras.ps1" to the new folder.
* These customer specific variables in the script needs to be set manually.<br>
* For HTTPS: The servername should be equal to the the issuer of the certificate.<br>
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/2c1f841e-d99b-46ba-9d99-6b10f3b3f9e0)
## Certification is required for HTTPS
* From REST-API server copy this certificate "C:\HERNIS\Configuration\RESTModule\RESTModuleSSLCertificate.cer" to the REST client.<br>
* On the REST client open "Manage user certificates" and from "Trusted Root Certification Authorities/Certificates" import the certificate.
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/221d92a2-4c5e-451c-a396-7d80cbf7379f)
## Task Scheduler
Create Basic Task:<br>
Follow the "Create Basic Task Wizard":<br>
Use the default settings except for the 2 examples below.<br>
* Choose a trigger.<br>
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/b969060d-e1a3-47ba-a9fc-3fa81f0cf1c8)
* Start a Program<br>
  * Program/script: The PowerShell it self.<br>
  * Argument: The location and the file "StartWiperOnCameras.ps1".<br>
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/be38ef81-bf89-4361-a536-89299752cfff)
## Logging of the REST-API requests
In HERNIS Watchdog Control:<br>
* Stop REST Module
* Right click on REST Module. Select Advanced -> Enable logging of all requests
* Start REST Module

REST-API request are stored here:
* C:\HERNIS\Logs\RESTModule\RESTModuleLog_202403_0001.xml
## Example from a manual script execution
![image](https://github.com/LeifKlemetsen-eaton/AutomaticWipeScript/assets/115617622/4e44f05e-877f-4f72-902e-e949d43b7f56)
