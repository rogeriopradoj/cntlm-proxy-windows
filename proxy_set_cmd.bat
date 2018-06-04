@echo off

echo.
echo "==> set http_proxy, https_proxy and all_proxy environment variables"
set http_proxy=http://127.0.0.1:3128
set https_proxy=%http_proxy%
set all_proxy=%http_proxy%
echo.
echo "   - http_proxy : " %http_proxy%
echo "   - https_proxy: " %https_proxy%
echo "   - all_proxy: " %all_proxy%
echo.
echo ".ok"

echo.
