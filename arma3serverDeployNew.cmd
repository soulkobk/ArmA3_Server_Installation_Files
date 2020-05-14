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

:: the path to the main arma 3 sever installation
set mainserverpath=C:\Arma 3 - Main Server
:: the path to the deploy arma 3 server installation
set deployserverpath=C:\Arma 3 - Servers
:: the path to the arma 3 installation files
set installationpath=C:\Arma 3 - Installation Files

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DON'T EDIT BELOW HERE! YOU'LL FCK SHIT UP - SOULKOBK ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo --------------------------------------------------
echo + ARMA 3 DEPLOY NEW SERVER...
echo --------------------------------------------------

set /p userinputpath=+ DIRECTORY NAME ? 

set targetpath="%deployserverpath%\%userinputpath%"

if not exist "%deployserverpath%" (
	echo --------------------------------------------------
	echo + DIRECTORY %userinputpath% CREATED
	mkdir "%deployserverpath%" >nul 2>&1
)

pushd "%targetpath%" >nul 2>&1
if !errorlevel! == 0 (
	echo --------------------------------------------------
	echo - DIRECTORY %userinputpath% EXISTS, UPDATING INSTALL
	goto :updateinstall
)
if !errorlevel! == 1 (
	echo --------------------------------------------------
	echo + DIRECTORY %userinputpath% CREATED, PROCEEDING WITH INSTALL
	mkdir %targetpath% >nul 2>&1
)

echo --------------------------------------------------
::directories
echo + LINKING DIRECTORIES...
for /f %%a in ('dir "%mainserverpath%\*" /a:d-l /b') do (
	mklink /d "%targetpath:"=%\%%~a" "%mainserverpath:"=%\%%~a" >nul 2>&1
)
::files
echo + LINKING FILES...
for /f %%a in ('dir "%mainserverpath%\*" /a:-d-l /b') do (
	mklink "%targetpath:"=%\%%~a" "%mainserverpath:"=%\%%~a" >nul 2>&1
)

echo --------------------------------------------------
::directory updates for localization
pushd "%targetpath:"=%\cmd" >nul 2>&1
if !errorlevel! == 0 (
	echo + REMOVED CMD FOLDER LINK...
	rmdir "%targetpath:"=%\cmd" >nul 2>&1
	echo + CREATED CMD FOLDER LOCAL...
	mkdir "%targetpath:"=%\cmd" >nul 2>&1
)
if !errorlevel! == 1 (
	echo + CREATED CMD FOLDER LOCAL...
	mkdir "%targetpath:"=%\cmd" >nul 2>&1
)

pushd "%targetpath:"=%\profile" >nul 2>&1
if !errorlevel! == 0 (
	echo + REMOVED PROFILE FOLDER LINK...
	rmdir "%targetpath:"=%\profile" >nul 2>&1
	echo + CREATED PROFILE FOLDER LOCAL...
	mkdir "%targetpath:"=%\profile" >nul 2>&1
)
if !errorlevel! == 1 (
	echo + CREATED PROFILE FOLDER LOCAL...
	mkdir "%targetpath:"=%\profile" >nul 2>&1
)

pushd "%targetpath:"=%\mpmissions" >nul 2>&1
if !errorlevel! == 0 (
	echo + REMOVED MPMISSION FOLDER LINK...
	rmdir "%targetpath:"=%\mpmissions" >nul 2>&1
	echo + CREATED MPMISSION FOLDER LOCAL...
	mkdir "%targetpath:"=%\mpmissions" >nul 2>&1
)
if !errorlevel! == 1 (
	echo + CREATED MPMISSION FOLDER LOCAL...
	mkdir "%targetpath:"=%\mpmissions" >nul 2>&1
)

pushd "%targetpath:"=%\keys" >nul 2>&1
if !errorlevel! == 0 (
	echo + REMOVED KEYS FOLDER LINK...
	rmdir "%targetpath:"=%\keys" >nul 2>&1
	echo + CREATED KEYS FOLDER LOCAL...
	mkdir "%targetpath:"=%\keys" >nul 2>&1
)
if !errorlevel! == 1 (
	echo + CREATED KEYS FOLDER LOCAL...
	mkdir "%targetpath:"=%\keys" >nul 2>&1
)

pushd "%targetpath:"=%\logs" >nul 2>&1
if !errorlevel! == 0 (
	echo + REMOVED LOGS FOLDER LINK...
	rmdir "%targetpath:"=%\logs" >nul 2>&1
	echo + CREATED LOGS FOLDER LOCAL...
	mkdir "%targetpath:"=%\logs" >nul 2>&1
)
if !errorlevel! == 1 (
	echo + CREATED LOGS FOLDER LOCAL...
	mkdir "%targetpath:"=%\logs" >nul 2>&1
)

echo --------------------------------------------------

::exe files
dir "%mainserverpath%\*.exe*" /a:-d /b >nul 2>&1
if !errorlevel! == 0 (
	echo + DELETING UNNEEDED EXE FILES...
	for /f %%a in ('dir "%mainserverpath%\*.exe*" /a:-d /b') do (
		del "%targetpath:"=%\%%~a" >nul 2>&1
	)
)
::pbo files
dir "%mainserverpath%\*.pbo*" /a:-d /b >nul 2>&1
if !errorlevel! == 0 (
	echo + DELETING UNNEEDED PBO FILES...
	for /f %%a in ('dir "%mainserverpath%\*.pbo*" /a:-d /b') do (
		del "%targetpath:"=%\%%~a" >nul 2>&1
	)
)
::zip files
dir "%mainserverpath%\*.zip*" /a:-d /b >nul 2>&1
if !errorlevel! == 0 (
	echo + DELETING UNNEEDED ZIP FILES...
	for /f %%a in ('dir "%mainserverpath%\*.zip*" /a:-d /b') do (
		del "%targetpath:"=%\%%~a" >nul 2>&1
	)
)
::rar files
dir "%mainserverpath%\*.rar*" /a:-d /b >nul 2>&1
if !errorlevel! == 0 (
	echo + DELETING UNNEEDED RAR FILES...
	for /f %%a in ('dir "%mainserverpath%\*.rar*" /a:-d /b') do (
		del "%targetpath:"=%\%%~a" >nul 2>&1
	)
)
::7z files
dir "%mainserverpath%\*.7z*" /a:-d /b >nul 2>&1
if !errorlevel! == 0 (
	echo + DELETING UNNEEDED 7Z FILES...
	for /f %%a in ('dir "%mainserverpath%\*.7z*" /a:-d /b') do (
		del "%targetpath:"=%\%%~a" >nul 2>&1
	)
)

echo + COPYING SERVER EXECUTABLE FILES...
copy /B /V /Y "%mainserverpath:"=%\arma3server.exe" "%targetpath:"=%\%userinputpath%.exe" >nul 2>&1
copy /B /V /Y "%mainserverpath:"=%\arma3server_x64.exe" "%targetpath:"=%\%userinputpath%_x64.exe" >nul 2>&1

echo + COPYING DEFAULT CONFIG FILES...
for /f %%a in ('dir "%installationpath%\serverTemplates\*.cfg" /a:-d /b') do (
	copy /B /V /Y "%installationpath:"=%\serverTemplates\%%~a" "%targetpath:"=%\%%~a" >nul 2>&1
)

echo + COPYING DEFAULT SERVER LAUNCH FILES...
for /f %%a in ('dir "%installationpath%\serverTemplates\*.cmd" /a:-d /b') do (
	copy /B /V /Y "%installationpath:"=%\serverTemplates\%%~a" "%targetpath:"=%\cmd\%%~a" >nul 2>&1
)

pushd "%targetpath:"=%\profile\Users\%userinputpath%" >nul 2>&1
if !errorlevel! == 1 (
	mkdir "%targetpath:"=%\profile\Users\%userinputpath%" >nul 2>&1
)
echo + COPYING ARMA3PROFILE FILE...
for /f %%a in ('dir "%installationpath%\serverTemplates\*.Arma3Profile" /a:-d /b') do (
	copy /B /V /Y "%installationpath:"=%\serverTemplates\%%~a" "%targetpath:"=%\profile\Users\%userinputpath%\%%~a" >nul 2>&1
	move /Y "%targetpath:"=%\profile\Users\%userinputpath%\%%~a" "%targetpath:"=%\profile\Users\%userinputpath%\%userinputpath%.Arma3Profile" >nul 2>&1
)

echo --------------------------------------------------
echo + NEW SERVER DEPLOY OF %userinputpath% COMPLETE.
echo --------------------------------------------------
pause
exit /b

:updateinstall
echo --------------------------------------------------
echo + UPDATING ARMA3SERVER EXE FILES...
copy /B /V /Y "%mainserverpath:"=%\arma3server.exe" "%targetpath:"=%\%userinputpath%.exe" >nul 2>&1
copy /B /V /Y "%mainserverpath:"=%\arma3server_x64.exe" "%targetpath:"=%\%userinputpath%_x64.exe" >nul 2>&1

echo --------------------------------------------------
echo + UPDATED DEPLOY OF %userinputpath% COMPLETE.
echo --------------------------------------------------

pause
exit /b