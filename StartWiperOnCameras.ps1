###########################################################################
###                                                                     ###
###               PowerShell Script that uses REST API                  ###
###            This script sends WIPE cmd to cameras in a list          ###
###             The 6 variables below are customer specific             ######                                                                     ##############################################################################

$camerasWithWiper = 30, 39, 47      # Comma seperated list of cameras to wipe
$mstrRestHost     = "Servername"    # Server name or IP address with REST API
$mstrUserName     = ""              # Username
$mstrPassword     = ""              # Password
$tcp              = "444"           # Port for REST API
$mstrRestProtocol = "HTTPS"         # Secure: HTTPS or unsecure: HTTP

###########################################################################
###                                                                     ###
###                End of customer specific variables                   ######                                                                     ##############################################################################

#User and Password handling
$mstrAuthInfo     = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("$mstrUserName`:$mstrPassword"))
$mstrRestHeaders  = @{"X-Requested-With"="powershell";"Authorization"="Basic $mstrAuthInfo"}            

#Send REST call
function RestCall($method, $path, $JSON, $expectedCode, $expectedDescription)
{
    Start-Sleep -m 200

    Try
    {
        $strUrl = $mstrRestProtocol + "://" + $mstrRestHost + ":" + $tcp + $path 
        Write-Host $method    $strUrl    $JSON  -ForegroundColor yellow
                       
        $result = Invoke-RestMethod -Method $method -Uri $strUrl -headers $mstrRestHeaders -body $JSON -ContentType 'application/json' -ErrorVariable RestError -ErrorAction SilentlyContinue

        return $result
    }
    Catch
    {

        Write-Host $_
        
        $count = 0

        #StatusCode
        if($expectedCode -eq $_.Exception.Response.StatusCode.value__)
        {
            Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__  -ForegroundColor cyan
            $count ++
        }
        else {Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__  -ForegroundColor red}

        #StatusDescription
        if($expectedDescription -eq $_.Exception.Response.StatusDescription)
        {
            Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription -ForegroundColor cyan
            $count ++
        }
        else {Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription -ForegroundColor red}
        
        #StatusCode or StatusDescription are not as expected
        If($count -ne 2)
        {
            Write-Host "Exception:" $_.Exception -ForegroundColor red
        }
    }
    return 1
}

#Handle the respnse from REST API
function ResultHandling($valueReturned)
{
    if($valueReturned -ne "1")
    {
        Write-Host "Response:`n"($valueReturned | Format-List | Out-String) "`n"  -ForegroundColor green
    }
    else
    {
        Write-Host
    }
}


#############################################################
###                  Rest API CMDs                        ###
#############################################################

#Status
ResultHandling(RestCall "OPTIONS" "/status")

#Start Wipe foreach camera in the comma separated list of cameras
foreach($camera in $camerasWithWiper)
{
    ResultHandling(RestCall "PUT" "/inputs/$camera/Wipe")
}

#############################################################
###               End ofRest API CMDs                     ###
#############################################################
