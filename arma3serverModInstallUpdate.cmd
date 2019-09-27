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

:: username password (needs to have arma 3 game purchase in order to download new mods, anonymous login will not work)
set steamlogin=anonymous

:: ----------------------------------------------------

:: server mod list consists of = steamid,steamname;^ be sure to change any bad characters like : and | to -
set servermodlist=^
1160452826,There is Only War Mod - Release 5 BETA;^
1200979818,Napoleonic Era Extended;^
1377912885,ACE - No medical [Updated];^
REM 1470493486,dbo_horses;^
1502320540,Project Uncut;^
333310405,Enhanced Movement;^
REM 339479337,Wake Island;^
450814997,CBA_A3;^
463939057,ace;^
498740884,ShackTac User Interface;^
524622628,Bozcaada;^
583496184,CUP Terrains - Core;^
583544987,CUP Terrains - Maps;^
REM 620260972,ALiVE;^
REM 623475643,3den Enhanced;^
639837898,Advanced Towing;^
REM 642912021,ZEC - Zeus and Eden Templates - Building Compositions;^
REM 660460283,IFA3_AIO_LITE;^
708250744,ACEX;^
713709341,Advanced Rappelling;^
723217262,Achilles;^
730310357,Advanced Urban Rappelling;^
735566597,Project OPFOR;^
751965892,ACRE2;^
REM 755210821,QS Mag Repack;^
766491311,ACE 3 Extension (Animations and Actions);^
767380317,Blastcore Edited (standalone version);^
REM 769440155,Operation- TREBUCHET;^
779520435,Multi-play Uniforms;^
REM 786777307,DonkeyPunch.INFO Open Chernarus Project;^
828493030,Iron Front ArmA 3 - Faces of War Compatibility patch;^
837729515,CH View Distance;^
843425103,RHSAFRF;^
843577117,RHSUSAF;^
843593391,RHSGREF;^
REM 861133494,JSRS SOUNDMOD;^
891433622,Faces of war;^
909547724,LYTHIUM;^
REM 943001311,The_Unsung_Vietnam_War_Mod;^
950999958,IFA3 liberation;^
952761380,IFA3 liberation ACE;^
REM 000000000,LEAVE THIS REM AT THE END OF THE LIST

:: ----------------------------------------------------
::   YOU SHOULDN'T HAVE TO CHANGE THE BELOW SETTINGS!
:: ----------------------------------------------------
	
:: path to steamCMD.exe
set steamexe=C:\Arma 3 - Installation Files\serverTools\steamCMD\steamCMD.exe

:: path to install the arma 3 server mods
set servermodpath=C:\Arma 3 - Server Mods

:: steam id of arma 3 server (use 107410 not 233780)
set serverbranch=107410
	
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DON'T EDIT BELOW HERE! YOU'LL FCK SHIT UP - SOULKOBK ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pushd "%servermodpath%"
if !errorlevel! == 1 (
	echo --------------------------------------------------
	echo  %servermodpath% DIRECTORY CREATED
	mkdir "%servermodpath%" >nul 2>&1
)

if not "!servermodlist!" == "" (
	echo --------------------------------------------------	
	echo  MODS PATH IS %servermodpath%
	echo --------------------------------------------------	
	for %%a in ("!servermodlist:;=";"!") do (
		set servermod=%%~a
		echo.!servermod:~0,3! | findstr /C:"REM">nul || (
			for /f "tokens=1* delims=," %%x in ("!servermod!") do (
				set steamid=%%x
				set steamname=%%y
				if exist "%servermodpath%\steamapps\workshop\content\%serverbranch%\!steamid!" (
					echo --------------------------------------------------
					echo  UPDATING MOD !steamid! - !steamname!
					"%steamexe%" +login %steamlogin% +force_install_dir "%servermodpath%" +"workshop_download_item %serverbranch% !steamid!" validate +quit >nul 2>&1
					echo  UPDATE COMPLETE
				) else (
					echo --------------------------------------------------
					echo  INSTALLING MOD !steamid! - !steamname!
					"%steamexe%" +login %steamlogin% +force_install_dir "%servermodpath%" +"workshop_download_item %serverbranch% !steamid!" validate +quit >nul 2>&1
					if exist "%servermodpath%\steamapps\workshop\content\%serverbranch%\!steamid!" (
						echo  INSTALL COMPLETE
						mklink /J "%servermodpath%\@!steamname!" "%servermodpath%\steamapps\workshop\content\%serverbranch%\!steamid!%" >nul 2>&1
						echo  DIRECTORY LINK @!steamname! CREATED
					) else (
						echo  INSTALL ERROR
					)
				)
			)
		)
	)
)
echo --------------------------------------------------

pause
exit /b

:: ----------------------------------------------------
