@echo off
title .==.                Inicializa gontlm-proxy              .==.
rem Inicializa proxy gontlm-proxy

mode con:cols=80 lines=100
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 1252>nul
setlocal EnableDelayedExpansion

set ENVFILE="%~dp0.env"
IF NOT EXIST %ENVFILE% (
    echo "Arquivo %ENVFILE% nao localizado. Dica: copie o arquivo .env.example da raiz do projeto"
    goto:eof
)

call:GetEnvValue "GONTLM_LISTEN" GONTLM_LISTEN

if not "%1" == "-y" (
    goto prompt_user
)
goto main

:prompt_user
cls
echo.
echo.==================================================================
echo.==                           CONFIGS                            ==
echo.==================================================================
echo.
echo. Voce pode passar o parametro -y para nao ser questionado e
echo. deixar os valores padroes serem utilizados.
echo. 
echo.     ^> proxy_start.bat -y
echo. 
echo.
echo.==================================================================
echo.
pause

cls
echo.
echo.==================================================================
echo.==                           CONFIGS                            ==
echo.==================================================================
echo.

echo.   - GONTLM_LISTEN: !GONTLM_LISTEN!
echo.
set /p PX_TEMP_VAR_2="...Digite novo valor, ou <ENTER> para continuar..."
if not "!PX_TEMP_VAR_2!" == "" (
    set GONTLM_LISTEN="!PX_TEMP_VAR_2!"
    echo.   **Alterado** GONTLM_LISTEN: !GONTLM_LISTEN!
)
echo.

goto main

:main
cls
echo.
echo.==================================================================
echo.==                           CONFIGS                            ==
echo.==================================================================
echo.
echo.   - GONTLM_LISTEN: !GONTLM_LISTEN!
echo.
echo.   - USERDOMAIN: %USERDOMAIN%
echo.
echo.   - USERNAME:   %USERNAME%
echo.
echo.==================================================================
echo.

%~dp0vendor\gontlm-proxy-v0.5.21\gontlm-proxy.exe --bind=http://!GONTLM_LISTEN! --verbose

endlocal
chcp %cp%>nul

:GetEnvValue
@FOR /F "tokens=2 delims==" %%a in ('%WINDIR%\system32\find "%~1=" %ENVFILE%') do @set %~2=%%a
@goto:eof