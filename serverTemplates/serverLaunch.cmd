@setlocal
@echo off
color F

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

:: EDIT THE DETAILS...

:: SERVER NAME, SAME AS THE DIRECTORY NAME
set servername=??????
:: SERVER EXE NAME (RENAMED arma3server_x64.exe TO DIFFERENTIATE SERVERS IN TASKMANAGER/SCRIPTS)
set exename=arma3server_x64.exe
:: SERVER EXE PRIORITY (LOW,NORMAL,HIGH,REALTIME,ABOVENORMAL,BELOWNORMAL)
set exepriority=REALTIME
:: SERVER PATH (ROOT)
set serverpath=C:\Arma 3 - Servers
:: SERVER MOD PATH (ROOT)
set servermodpath=C:\Arma 3 - Mods

set exepath=%serverpath%\%servername%
set keyspath=%serverpath%\%servername%\keys
set defaultkeyspath=%serverpath%\%servername%\keysdefault
set configcfg=%serverpath%\%servername%\server.cfg
set basiccfg=%serverpath%\%servername%\basic.cfg
set serverprofile=%serverpath%\%servername%\profile
set serveroptions=-noPause -noSound -filePatching -enableHT -bandwidthAlg=2 -maxMem=4096 -world=empty -autoInit
set serverport=2902

:: MOD NAMES ONLY, NO PATHS, PLACE ;^ AT THE END OF EACH LINE
set servermodlist=^
REM @LEAVE THIS REM AT THE END OF THE LIST

set clientmodlist=^
REM @3CB BAF Equipment;^
REM @3CB BAF Units;^
REM @3CB BAF Vehicles;^
REM @3CB BAF Weapons;^
REM @3CB Factions;^
@ACE 3 Extension (Animations and Actions);^
@ACE Compat - RHS Armed Forces of the Russian Federation;^
@ACE Compat - RHS United States Armed Forces;^
@ACE Compat - RHS- GREF;^
@ace;^
REM @Achilles;^
@ACRE2;^
REM @ADR-97 Weapon Pack (Official Mod);^
@Advanced Rappelling;^
@Advanced Towing;^
@Advanced Urban Rappelling;^
REM @Bozcaada;^
REM @British Armed Forces Faction All In One;^
REM @BTHBC Terrains Core - Objects and Shared Definitions;^
@CBA_A3;^
REM @CLA CLAFGHAN;^
REM @Complementary Police Weapons;^
REM @CSAT ReTexture [ DrunkeN's Arsenal ];^
@CUP Terrains - Core;^
REM @CUP Terrains - CWA;^
@CUP Terrains - Maps;^
REM @CUP Units;^
REM @CUP Vehicles;^
REM @CUP Weapons;^
REM @Diyala Map;^
REM @Eden Objects;^
@Enhanced Movement;^
REM @Esseker;^
REM @Faces of war;^
REM @G.O.S Al Rayak;^
REM @G.O.S Song Bin Tahn;^
REM @HEBONTES MILITARY TRAINING GROUND;^
REM @IFA3 liberation ACE;^
REM @IFA3 liberation;^
REM @IFA3_AIO_LITE;^
REM @Imrali Island;^
REM @Iron Front ArmA 3 - Faces of War Compatibility patch;^
REM @Isla Duala 3.8;^
REM @Isla Duala 3.9.1;^
REM @Isla Duala 3.9;^
REM @Isla Duala;^
REM @Jbad;^
REM @Krasnorus Armed Forces and Police Department;^
REM @Krasnorus;^
REM @Kujari;^
REM @Kunduz, Afghanistan;^
REM @LAMBS_Danger.fsm;^
REM @Livonian Park Rangers;^
REM @Loot to Vehicle for ACE and Antistasi;^
REM @LYTHIUM;^
REM @PLP Containers;^
REM @PLP Materials;^
REM @PLP Urban Packs- Barriers and Fences;^
REM @Project OPFOR;^
REM @Project Uncut;^
@RHSAFRF;^
@RHSGREF;^
REM @RHSSAF;^
@RHSUSAF;^
@RKSL Studios- Attachments v3.01;^
REM @RKSL Studios- LCVP Mk5 Landing Craft;^
REM @Ruha;^
REM @Saint Kapaulio;^
@ShackTac User Interface;^
REM @Simplex Support Services;^
REM @Specialist Military Arms (SMA) Version 2.7.1;^
REM @Sugar Lake;^
REM @The_Unsung_Vietnam_War_Mod;^
REM @United Nations Texture Project;^
REM @Uriki's Mission Items;^
REM @VET_Unflipping;^
REM @VIDDA - ALPHA;^
REM @VIDDA - LEGACY VERSION;^
REM @Vinjesvingen;^
REM @Wake Island;^
REM @X-Cam-Taunus (Version 1.1);^
REM @Zombies and Demons;^
REM @LEAVE THIS REM AT THE END OF THE LIST

set optionalmodlist=^
@Achilles;^
REM @LEAVE THIS REM AT THE END OF THE LIST

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DON'T EDIT BELOW HERE! YOU'LL FCK SHIT UP - SOULKOBK ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

for /f "tokens=3 delims== " %%a in ('
	nslookup -debug myip.opendns.com. resolver1.opendns.com 2^>nul^ | findstr /c:"internet address"
') do set "serverip=%%a"

setlocal enabledelayedexpansion

title %servername% (%serverip% %serverport%)

if not "!servermodlist!" == ""  ( echo server mod list is not empty )

pushd "%keyspath%"
if !errorlevel! == 0 (
	echo --------------------------------------------------
	echo  + %servername% - DELETING OLD KEYS
	del "!keyspath!\*.*" /s /f /q >nul 2>&1
)
if !errorlevel! == 1 (
	echo --------------------------------------------------
	echo  - %servername% - SERVER KEYS DIRECTORY DOES NOT EXIST, CHECK THE CONFIGURATION, EXITING
	pause
	exit /b
)
pushd "%defaultkeyspath%"
if !errorlevel! == 0 (
	echo --------------------------------------------------
	echo  + %servername% - INSTALLING DEFAULT KEYS
	xcopy "!defaultkeyspath!\*.bikey*" "!keyspath!" /Y >nul 2>&1
)
if !errorlevel! == 1 (
	echo --------------------------------------------------
	echo  - %servername% - DEFAULT KEYS DIRECTORY DOES NOT EXIST, CHECK THE CONFIGURATION, EXITING
	pause
	exit /b
)
endlocal
echo --------------------------------------------------
echo  + %servername% - INSTALLING NEW KEYS
setlocal enabledelayedexpansion
set servermodlistfullpath=""
if not "!servermodlist!" == "" (
	for %%a in ("!servermodlist:;=";"!") do (
		set remcheck=%%~a
		echo.!remcheck:~0,3! | findstr /C:"REM">nul || (
			set currentdir=%servermodpath%\%%~a
			if exist !currentdir!\nul (
				if !servermodlistfullpath!=="" (
					set servermodlistfullpath=!servermodpath!\%%~a
				) else (
					set servermodlistfullpath=!servermodlistfullpath!;!servermodpath!\%%~a
				)
				if exist !currentdir!\key (
					for /f "tokens=*" %%b in ('dir "!currentdir!\key\*.bikey*" /b') do (
						if exist %%b do (
							echo    + SERVER %%~a\key\%%b
							xcopy "%servermodpath%\%%~a\key\%%b" "%keyspath%" /Y >nul 2>&1
						)
					)
				)
				if exist !currentdir!\keys (
					for /f "tokens=*" %%b in ('dir "!currentdir!\keys\*.bikey*" /b') do (
						if exist %%b do (
							echo    + SERVER %%~a\keys\%%b
							xcopy "%servermodpath%\%%~a\keys\%%b" "%keyspath%" /Y >nul 2>&1
						)
					)
				)
			)
		)
	)
)

:: CLIENT MOD LIST
set clientmodlistfullpath=""
if not "!clientmodlist!" == "" (
	for %%a in ("!clientmodlist:;=";"!") do (
		set remcheck=%%~a
		echo.!remcheck:~0,3! | findstr /C:"REM">nul || (
			set currentdir=%servermodpath%\%%~a
			if exist !currentdir!\nul (
				if !clientmodlistfullpath!=="" (
					set clientmodlistfullpath=!servermodpath!\%%~a
				) else (
					set clientmodlistfullpath=!clientmodlistfullpath!;!servermodpath!\%%~a
				)
				if exist !currentdir!\key (
					for /f "tokens=*" %%b in ('dir "!currentdir!\key\*.bikey*" /b') do (
						if exist %%b do (
							echo    + CLIENT %%~a\key\%%b
							xcopy "%servermodpath%\%%~a\key\%%b" "%keyspath%" /Y >nul 2>&1
						)
					)
				)
				if exist !currentdir!\keys (
					for /f "tokens=*" %%b in ('dir "!currentdir!\keys\*.bikey*" /b') do (
						if exist %%b do (
							echo    + CLIENT %%~a\keys\%%b
							xcopy "%servermodpath%\%%~a\keys\%%b" "%keyspath%" /Y >nul 2>&1
						)
					)
				)
			)
		)
	)
)

:: OPTIONAL MOD LIST
set optionalmodlistfullpath=""
if not "!optionalmodlist!" == "" (
	for %%a in ("!optionalmodlist:;=";"!") do (
		set remcheck=%%~a
		echo.!remcheck:~0,3! | findstr /C:"REM">nul || (
			set currentdir=%servermodpath%\%%~a
			if exist !currentdir!\nul (
				if !optionalmodlistfullpath!=="" (
					set optionalmodlistfullpath=!servermodpath!\%%~a
				) else (
					set optionalmodlistfullpath=!optionalmodlistfullpath!;!servermodpath!\%%~a
				)
				if exist !currentdir!\key (
					for /f "tokens=*" %%b in ('dir "!currentdir!\key\*.bikey*" /b') do (
						if exist %%b do (
							echo    + OPTION %%~a\key\%%b
							xcopy "%servermodpath%\%%~a\key\%%b" "%keyspath%" /Y >nul 2>&1
						)
					)
				)
				if exist !currentdir!\keys (
					for /f "tokens=*" %%b in ('dir "!currentdir!\keys\*.bikey*" /b') do (
						if exist %%b do (
							echo    + OPTION %%~a\keys\%%b
							xcopy "%servermodpath%\%%~a\keys\%%b" "%keyspath%" /Y >nul 2>&1
						)
					)
				)
			)
		)
	)
)

path=%exepath%;%path%

for /F "tokens=2 delims==;" %%a in ('findstr /c:"hostName =" "%configcfg%"') do (
	set serverdescription=%%a
	set serverdescription=!serverdescription:^"^=!
	echo --------------------------------------------------
	echo  + %servername% - SERVER STARTED
	echo --------------------------------------------------
	echo  + MISSION -!serverdescription!
	echo  + IP - %serverip%
	echo  + PORT - %serverport%
)

set commandline= -port=%serverport% "-config=%configcfg%" "-cfg=%basiccfg%" "-profiles=%serverprofile%" -name=%servername% "-servermod=%servermodlistfullpath%" "-mod=%clientmodlistfullpath%" %serveroptions%
start "%servername%" /D "%exepath%" /%exepriority% /WAIT "%exename%" %commandline%
