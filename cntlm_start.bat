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
call:GetEnvValue "CNTLM_DOMAIN" CNTLM_DOMAIN
call:GetEnvValue "CNTLM_USER" CNTLM_USER

echo.   - Digite seu usuario no formato ...
echo.
echo.		c123456
echo.
echo.   ---
echo.
echo.   - CNTLM_USER: !CNTLM_USER!
echo.
set /p CNTLM_TEMP_VAR_5="...Digite novo valor, ou <ENTER> para continuar...      "
if not "!CNTLM_TEMP_VAR_5!" == "" (
    set CNTLM_USER="!CNTLM_TEMP_VAR_5!"
    echo.   **Alterado** CNTLM_USER: !CNTLM_USER!
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
echo.   - CNTLM_DOMAIN: !CNTLM_DOMAIN!
echo.
echo.   - CNTLM_USER: !CNTLM_USER!
echo.
echo.==================================================================
echo.

%~dp0cntlm.exe -v -d !CNTLM_DOMAIN! -u !CNTLM_USER! -I -l !CNTLM_LISTEN! -N !CNTLM_NO_PROXY! !CNTLM_PROXY!

endlocal
chcp %cp%>nul

:GetEnvValue
@FOR /F "tokens=2 delims==" %%a in ('%WINDIR%\system32\find "%~1=" %ENVFILE%') do @set %~2=%%a
@goto:eof