@echo off
setlocal enabledelayedexpansion

:: ----------------------------------------------------------------------------------------------

:: Copyright © 2019 soulkobk (soulkobk.blogspot.com)

:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU Affero General Public License as
:: published by the Free Software Foundation, either version 3 of the
:: License, or (at your option) any later version.

:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
:: GNU Affero General Public License for more details.

:: You should have received a copy of the GNU Affero General Public License
:: along with this program. If not, see <http://www.gnu.org/licenses/>.

:: ----------------------------------------------------------------------------------------------

:: username password (anonymous login will not work)
set steamlogin=anonymous

:: ----------------------------------------------------
::   YOU SHOULDN'T HAVE TO CHANGE THE BELOW SETTINGS!
:: ----------------------------------------------------
	
:: path to steamCMD.exe
set steamexe=C:\Arma 3 - Installation Files\serverTools\steamCMD\steamCMD.exe
REM download it from here... http://media.steampowered.com/installer/steamcmd.zip

:: path to install the main arma 3 server
set serverpath=C:\Arma 3 - Main Server

:: path to deploy new (linked) servers
set deploypath=C:\Arma 3 - Servers

:: steam id of arma 3 server
set serverbranch=233780 -beta
	
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DON'T EDIT BELOW HERE! YOU'LL FCK SHIT UP - SOULKOBK ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo.
echo --------------------------------------------------
echo        ARMA 3 SERVER INSTALLATION/UPDATE
echo --------------------------------------------------
echo  SERVER PATH: %serverpath%
echo  BRANCH: %serverbranch%
echo --------------------------------------------------
echo.
echo             PRESS "ENTER" TO PROCEED
echo.

pause

if not exist "%serverpath%" (
	mkdir "%serverpath%"
	echo --------------------------------------------------
	echo  SERVER DIRECTORY CREATED, INSTALLING...
	goto :execute
)
if exist "%serverpath%" (
	echo --------------------------------------------------
	echo  SERVER DIRECTORY ALREADY EXISTS, UPDATING...
	goto :execute
)

:execute
echo "%steamexe%" +login %steamlogin% +force_install_dir "%serverpath%" +"app_update %serverbranch%" validate +quit

echo.
echo --------------------------------------------------
echo     ARMA 3 SERVER INSTALLATION/UPDATE COMPLETE
echo --------------------------------------------------
echo.
echo             PRESS "ENTER" TO EXIT
pause

:: _________________________________________________________
