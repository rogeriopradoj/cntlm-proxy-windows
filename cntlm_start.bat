@echo off
title .==.                Inicializa cntlm              .==.
rem Inicializa proxy cntlm

mode con:cols=80 lines=100
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 1252>nul
setlocal EnableDelayedExpansion

set ENVFILE="%~dp0.env"
IF NOT EXIST %ENVFILE% (
    echo "Arquivo %ENVFILE% nao localizado. Dica: copie o arquivo .env.example da raiz do projeto"
    goto:eof
)

call:GetEnvValue "CNTLM_NO_PROXY" CNTLM_NO_PROXY
call:GetEnvValue "CNTLM_LISTEN" CNTLM_LISTEN
call:GetEnvValue "CNTLM_PROXY" CNTLM_PROXY

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
echo. Você pode passar o parâmetro -y para não ser questionado e
echo. deixar os valores padrões serão utilizados.
echo. 
echo.     ^> proxy_start.bat -y
echo. 
echo. Observação.: A senha(Password) sempre é solicitada.
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

echo.   - CNTLM_NO_PROXY: !CNTLM_NO_PROXY!
echo.
set /p CNTLM_TEMP_VAR_1="...Digite novo valor, ou <ENTER> para continuar..."
if not "!CNTLM_TEMP_VAR_1!" == "" (
    set CNTLM_NO_PROXY="!CNTLM_TEMP_VAR_1!"
    echo.   **Alterado** CNTLM_NO_PROXY: !CNTLM_NO_PROXY!
)
echo.

echo.   - CNTLM_LISTEN: !CNTLM_LISTEN!
echo.
set /p CNTLM_TEMP_VAR_2="...Digite novo valor, ou <ENTER> para continuar..."
if not "!CNTLM_TEMP_VAR_2!" == "" (
    set CNTLM_LISTEN="!CNTLM_TEMP_VAR_2!"
    echo.   **Alterado** CNTLM_LISTEN: !CNTLM_LISTEN!
)
echo.

echo.   - CNTLM_PROXY: !CNTLM_PROXY!
echo.
set /p CNTLM_TEMP_VAR_3="...Digite novo valor, ou <ENTER> para continuar..."
if not "!CNTLM_TEMP_VAR_3!" == "" (
    set CNTLM_PROXY="!CNTLM_TEMP_VAR_3!"
    echo.   **Alterado** CNTLM_PROXY: !CNTLM_PROXY!
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
echo.   - CNTLM_NO_PROXY: !CNTLM_NO_PROXY!
echo.
echo.   - CNTLM_LISTEN: !CNTLM_LISTEN!
echo.
echo.   - CNTLM_PROXY: !CNTLM_PROXY!
echo.
echo.   - USERDOMAIN: %USERDOMAIN%
echo.
echo.   - USERNAME:   %USERNAME%
echo.
echo.==================================================================
echo.

%~dp0cntlm.exe -v -d %userdomain% -u %username% -I -l !CNTLM_LISTEN! -N !CNTLM_NO_PROXY! !CNTLM_PROXY!

endlocal
chcp %cp%>nul

:GetEnvValue
@FOR /F "tokens=2 delims==" %%a in ('find "%~1=" %ENVFILE%') do @set %~2=%%a
@goto:eof