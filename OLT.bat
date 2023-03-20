@echo off
setlocal enabledelayedexpansion

:: Configuração das OLTs

set OLT[1].name=Data Center
set OLT[1].ip=?
set OLT[1].key=1

set OLT[2].name=Novo Recreio
set OLT[2].ip=?
set OLT[2].key=2

set OLT[3].name=Mikail
set OLT[3].ip=?
set OLT[3].key=3

set OLT[4].name=FAT III
set OLT[4].ip=?
set OLT[4].key=4

set OLT[5].name=Felipe Guarnieri
set OLT[5].ip=?
set OLT[5].key=5

set OLT[6].name=Santos Dumont
set OLT[6].ip=?
set OLT[6].key=6

set OLT[7].name=Guarulho
set OLT[7].ip=?
set OLT[7].key=7

set OLT[8].name=Old Recreio
set OLT[8].ip=?
set OLT[8].key=8

set OLT[9].name=Vila Operaria
set OLT[9].ip=?
set OLT[9].key=9



:: Loop principal
:menu
cls

rem Define a cor do fundo e do texto
color 0d

echo #  #######   #####   ######     ##       ####    #####             ###      ####    ##   ##  ###  ## #
echo #   ##   #  ##   ##   ##  ##   ####     ##  ##  ##   ##             ##       ##     ###  ##   ##  ## #
echo #   ## #    #         ##  ##  ##  ##   ##       ##   ##             ##       ##     #### ##   ## ## #
echo #   ####     #####    #####   ##  ##   ##       ##   ##             ##       ##     ## ####   #### #
echo #   ## #         ##   ##      ######   ##       ##   ##             ##       ##     ##  ###   ## ## #
echo #   ##   #  ##   ##   ##      ##  ##    ##  ##  ##   ##             ##       ##     ##   ##   ##  ## #
echo #  #######   #####   ####     ##  ##     ####    #####             ####     ####    ##   ##  ###  ## #
echo.
echo.
echo.
echo.


echo "Data: %DATE%
echo "Hora: %TIME%
echo.
echo ========================================================================= 
echo Computador : %computername%        Usuario: %username%
echo Empresa : ESPACO LINK              Usuario Host: Dave O'Atlas
echo =========================================================================
echo            MENU TAREFAS
echo ========================================================================= 

@echo.

echo "Selecione uma OLT para acessar:"
echo.
for /l %%i in (1, 1, 9) do (
    echo "%%i. !OLT[%%i].name!
)

echo "q. Sair"
echo "h. ajuda"
set /p escolha=""



if "%escolha%"=="q" goto :fim

if "%escolha%"=="h" goto :ajuda

if "%escolha%"=="fabio" goto :aviso

for /l %%i in (1, 1, 9) do (
    if /i "%escolha%"=="!OLT[%%i].key!" (
        set olt_ip=!OLT[%%i].ip!
      
        goto :acesso_olt
    )
)
pause
goto :menu

echo "Tecla invalida. Tente novamente."
pause
goto :menu



:abrir_terminal_telnet
echo "Abrindo terminal com telnet..."
start cmd.exe /c telnet %olt_ip%
timeout /t 5

:acesso_olt
echo "Acessando OLT %olt_ip% com usuario %olt_user%..."
start cmd.exe /c telnet %olt_ip%
pause
goto :menu

echo.
echo.
echo.


:aviso

echo       *****************************************************  ***************************************
echo       *         DESCRICAO DE PLACA/CLIENTE                *  *         LISTA DE SENHA              *
echo       *                                                   *  ***************************************
echo       * display board ?/? - Retorna a Placa Desejada      *  * OLTs                                *
echo       * display ont info by-sn - Retorna Serial Number    *  * nome de usuario:                    *
echo       * display ont info by-desc - Descreve a Placa       *  * senha:                              *
echo       * display ont info ?/?/? all - (Chassi/Placa/Porta) *  *                                     *
echo       * undo service-port port ?/?/?                      *  * OLT Vila Operaria:                  *
echo       * interface gpon ?/?                                *  * Nome de usuario:                    *
echo       * ont delete ? ?                                    *  * Senha:                              *
echo       *****************************************************  ***************************************

pause
goto menu

:ajuda

echo       *****************************************************  
echo       *         DESCRICAO DE PLACA/CLIENTE                *  
echo       * ***************************************************  
echo       * display board ?/? - Retorna a Placa Desejada      *  
echo       * display ont info by-sn - Retorna Serial Number    *  
echo       * display ont info by-desc - Descreve a Placa       *  
echo       * display ont info ?/?/? all - (Chassi/Placa/Porta) *  
echo       * undo service-port port ?/?/?-deleta clinte da OLT *  
echo       * interface gpon ?/?                                *  
echo       * ont delete ? ?                                    * 
echo       *****************************************************  

pause
goto :menu
