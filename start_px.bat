@echo off
title .==.                Inicializa px              .==.
rem Inicializa proxy px

mode con:cols=80 lines=100
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 1252>nul
setlocal EnableDelayedExpansion

set ENVFILE="%~dp0.env"
IF NOT EXIST %ENVFILE% (
    echo "Arquivo %ENVFILE% nao localizado. Dica: copie o arquivo .env.example da raiz do projeto"
    goto:eof
)

call:GetEnvValue "PX_NO_PROXY" PX_NO_PROXY
call:GetEnvValue "PX_PORT" PX_PORT
call:GetEnvValue "PX_PROXY" PX_PROXY

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

echo.   - PX_NO_PROXY: !PX_NO_PROXY!
echo.
set /p PX_TEMP_VAR_1="...Digite novo valor, ou <ENTER> para continuar..."
if not "!PX_TEMP_VAR_1!" == "" (
    set PX_NO_PROXY="!PX_TEMP_VAR_1!"
    echo.   **Alterado** PX_NO_PROXY: !PX_NO_PROXY!
)
echo.

echo.   - PX_PORT: !PX_PORT!
echo.
set /p PX_TEMP_VAR_2="...Digite novo valor, ou <ENTER> para continuar..."
if not "!PX_TEMP_VAR_2!" == "" (
    set PX_PORT="!PX_TEMP_VAR_2!"
    echo.   **Alterado** PX_PORT: !PX_PORT!
)
echo.

echo.   - PX_PROXY: !PX_PROXY!
echo.
set /p PX_TEMP_VAR_3="...Digite novo valor, ou <ENTER> para continuar..."
if not "!PX_TEMP_VAR_3!" == "" (
    set PX_PROXY="!PX_TEMP_VAR_3!"
    echo.   **Alterado** PX_PROXY: !PX_PROXY!
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
echo.   - PX_NO_PROXY: !PX_NO_PROXY!
echo.
echo.   - PX_PORT: !PX_PORT!
echo.
echo.   - PX_PROXY: !PX_PROXY!
echo.
echo.   - USERDOMAIN: %USERDOMAIN%
echo.
echo.   - USERNAME:   %USERNAME%
echo.
echo.==================================================================
echo.

%~dp0vendor\px-v0.0.0-2019-05-20\px.exe --proxy=!PX_PROXY! --listen=!PX_PORT! --noproxy=!PX_NO_PROXY! --gateway --foreground --verbose --debug --uniqlog

endlocal
chcp %cp%>nul

:GetEnvValue
@FOR /F "tokens=2 delims==" %%a in ('%WINDIR%\system32\find "%~1=" %ENVFILE%') do @set %~2=%%a
@goto:eof