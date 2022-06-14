Write-Host
Write-Host "==> set http_proxy, https_proxy and all_proxy environment variables"
$http_proxy = "http://127.0.0.1:3128"


$Env:http_proxy = $http_proxy
$Env:https_proxy = $http_proxy
$Env:all_proxy = $http_proxy

### Modify a user environment variable ###
[Environment]::SetEnvironmentVariable("http_proxy", $http_proxy, [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("https_proxy", $http_proxy, [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("all_proxy", $http_proxy, [System.EnvironmentVariableTarget]::User)

Write-Host
Write-Host "   - http_proxy : " $Env:http_proxy
Write-Host "   - https_proxy: " $Env:https_proxy
Write-Host "   - all_proxy: "   $Env:all_proxy
Write-Host
Write-Host ".ok"

Write-Host