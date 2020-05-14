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
463939057,ace;^
871504836,cTab;^
620019431,task_force_radio;^
893328083,3CB BAF Equipment;^
893346105,3CB BAF Units;^
893349825,3CB BAF Vehicles;^
893339590,3CB BAF Weapons;^
1673456286,3CB Factions;^
623475643,3den Enhanced;^
1190934425,6 x 6 All Terrain Vehicle;^
421620913,Kunduz Afghanistan;^
766491311,ACE 3 Extension (Animations and Actions);^
773131200,ACE Compat - RHS Armed Forces of the Russian Federation;^
773125288,ACE Compat - RHS United States Armed Forces;^
884966711,ACE Compat - RHS- GREF;^
751965892,ACRE2;^
669962280,ADR-97 Weapon Pack (Official Mod);^
1842439195,AMBUSH [SP - OFP Remake];^
1655157508,AUSSOF_LITE_mas;^
1260802825,AV-8B Harrier 2;^
723217262,Achilles;^
713709341,Advanced Rappelling;^
639837898,Advanced Towing;^
730310357,Advanced Urban Rappelling;^
1446500688,Angola Maps v1.3;^
1938939381,Arma 3 Apex- Old Man (Beta);^
1086746833,BTHBC Terrains Core - Objects and Shared Definitions;^
767380317,Blastcore Edited (standalone version);^
524622628,Bozcaada;^
425665761,British Armed Forces Faction All In One;^
450814997,CBA_A3;^
761349672,CLA CLAFGHAN;^
1861450180,CSAT ReTexture [ DrunkeN's Arsenal ];^
437865027,CSAT Snow Tigers 1.08;^
853743366,CUP Terrains - CWA;^
583496184,CUP Terrains - Core;^
583544987,CUP Terrains - Maps;^
497661914,CUP Units;^
541888371,CUP Vehicles;^
497660133,CUP Weapons;^
1789554117,Cham;^
1095745477,Chemical Warfare;^
951195196,Complementary Police Weapons;^
1946431719,Deserted VR;^
680808574,Diyala Map;^
686802825,Eden Objects;^
1613905318,Emitter 3Ditor;^
333310405,Enhanced Movement;^
498101407,Esseker;^
366425329,FIR AWS(AirWeaponSystem);^
891433622,Faces of War;^
648172507,G.O.S Al Rayak;^
693170122,G.O.S Song Bin Tahn;^
380892330,Gorgona;^
1412917989,HEBONTES MILITARY TRAINING GROUND;^
952761380,IFA3 liberation ACE;^
950999958,IFA3 liberation;^
660460283,IFA3_AIO_LITE;^
753946944,Immersion Cigs;^
317432405,Imrali Island;^
1883956552,Interiors for CUP;^
828493030,Iron Front ArmA 3 - Faces of War Compatibility patch;^
714149065,Isla Duala;^
708278910,Island Panthera;^
520618345,Jbad;^
1866738558,Khoramshahr (Beta);^
1844557653,Krasnorus Armed Forces and Police Department;^
1548849359,Krasnorus;^
1726494027,Kujari;^
1858075458,LAMBS_Danger.fsm;^
909547724,LYTHIUM;^
1819654119,Livonian Park Rangers;^
1439779114,Loot to Vehicle for ACE and Antistasi;^
962935279,MBG Buildings African Generic (Arma2 Legacy);^
823636749,MLO All-In-One Collection;^
1951690856,Metis Nature;^
749790006,Mogadishu;^
779520435,Multi-play Uniforms;^
1412859103,Overwatered;^
504690333,PLP Containers;^
1354397885,PLP Materials;^
701300272,PLP Urban Packs- Barriers and Fences;^
1529074643,Pook Boat Pack;^
862853123,Pook H-13 / Bell 47 Heli Pack;^
735566597,Project OPFOR;^
1502320540,Project Uncut;^
843425103,RHSAFRF;^
843593391,RHSGREF;^
1978754337,RHSPKL;^
843632231,RHSSAF;^
843577117,RHSUSAF;^
1661066023,RKSL Studios- Attachments v3.01;^
1752496126,RKSL Studios- LCVP Mk5 Landing Craft;^
1983487115,RnT Trenches - Standalone;^
1368857262,Ruha;^
1947100352,SGC Clothing;^
939686262,Saint Kapaulio;^
498740884,ShackTac User Interface;^
1850026051,Simplex Support Services;^
699630614,Specialist Military Arms (SMA) Version 2.7.1;^
550757941,Sugar Lake;^
1815797130,TD TFAR patch for DLC CONTACT;^
1914285758,TRIA [Terrain] ALPHA 0.2;^
894678801,Task Force Arrowhead Radio (BETA!!!);^
1899986937,Taviana_mod;^
667709746,UH-60 Pack A3;^
1145621857,UKSOF_LITE_mas;^
1508316023,United Nations Texture Project;^
943001311,Unsung;^
940841212,Uriki's Mission Items;^
1703187116,VET_Unflipping;^
1282716647,VIDDA - LEGACY VERSION;^
1757672655,Vinjesvingen;^
1926513010,Virolahti - Valtatie 7;^
339479337,Wake Island;^
1792394837,White_Phosphor;^
836147398,X-Cam-Taunus (Version 1.1);^
501966277,Zombies and Demons;^
882138618,[DISCONTINUED] Burnes Armories - MK10 Landing Craft Utility (LCU);^
2016198558,Malden Police Pack - D3S Cars;^
736829758,Military Gear Pack;^
1449064602,National Gear Pack;^
1449068453,Warfighers Pack;^
698078148,Spec4Gear.v4.6;^
1960024802,PLP All in One;^
1795825073,USP Gear And Uniforms;^
861133494,JSRS SOUNDMOD;^
1180534892,JSRS SOUNDMOD - RHS GREF Mod Pack Sound Support;^
1180533757,JSRS SOUNDMOD - RHS USAF Mod Pack Sound Support;^
945476727,JSRS SOUNDMOD - RHS AFRF Mod Pack Sound Support;^
1665585720,Project injury Reaction (PiR);^
1974617455,ACE3 for Project injury Reaction (PiR);^
1841648605,JSRS SOUNDMOD - Specialst Military Arms Mod Sounds;^
1841047025,Prone Launcher;^
1252091296,Tembelan Island;^
1503872807,Project Uncut - Optionals;^
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
