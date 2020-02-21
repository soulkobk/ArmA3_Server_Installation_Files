**HOW TO... (updated 20200221)**

**CREATE DIRECTORY STRUCTURE AND PLACE FILES...**
[1.0] Make Directory -> "C:\Arma 3 - Installation Files"
[1.1] Place these files inside "C:\Arma 3 - Installation Files".
 - "C:\Arma 3 - Installation Files"
 - "C:\Arma 3 - Installation Files\serverTemplates"
   + basic.cfg
   + server.cfg
   + serverLaunc.cmd
   + serverLaunchMonitor.cmd
   + serverProfile.Arma3profile
 - "C:\Arma 3 - Installation Files\serverTools"
   + steamCMD
 - "C:\Arma 3 - Installation Files\arma3serverDeployNew.cmd"
 - "C:\Arma 3 - Installation Files\arma3sercerInstallUpdate.cmd"
 - "C:\Arma 3 - Installation Files\arma3serverModInstallUpdate.cmd"
[1.2] Make Directory -> "C:\Arma 3 - Main Server"
[1.3] Make Directory -> "C:\Arma 3 - Server Mods"
[1.4] Make Directory -> "C:\Arma 3 - Servers"

**DOWNLOAD/CONFIGURE/INSTALL/RUN STEAMCMD..**
[2.0] Download steamCMD from http://media.steampowered.com/installer/steamcmd.zip and unzip it in to directory "C:\Arma 3 - Installation Files\serverTools\steamCMD"
[2.1] Edit the configuration of each of the .cmd files within "C:\Arma 3 Stuff\Arma 3 - Installation Files" (arma3serverInstallUpdate.cmd, arma3serverModInstallUpdate.cmd and arma3serverDeployNew.cmd).

**INSTALL ARMA 3 SERVER FILES...**
[3.0] To install Arma 3 Server, run the file arma3serverInstallUpdate.cmd (default installation directory "C:\Arma 3 - Main Server")

**INSTALL ARMA 3 MOD FILES...**
[4.0] To install Arma 3 Mods, run the file arma3serverModInstallUpdate.cmd (default installation directory "C:\Arma 3 - Server Mods"). Or if you have the mods elsewhere on your system already, you can either choose to copy them over to "C:\Arma 3 - Server Mods", or use use "MKLINK /J <LINK> <TARGET>" inside "C:\Arma 3 - Server Mods".

**DEPLOY AN ARMA 3 SERVER...**
[5.0] To deploy a new Arma 3 server, run the file arma3serverDeployNew.cmd (default installation directory "C:\Arma 3 - Servers") and follow the on-screen prompts (enter the name of your deployed server).

**EXECUTE/RUN DEPLOYED SERVER**
[6.0] To run the new server, enter the installation directory "C:\Arma 3 - Servers\<server name>".
[6.1] Configure your "C:\Arma 3 - Servers\<server name>\server.cfg" file.
[6.2] Place your mission file within the "C:\Arma 3 - Servers\<server name>\mpmissions" directory.
[6.3] Edit the configuration of the server launch files within directory "C:\Arma 3 - Servers\<server name>\cmd" (serverLaunch.cmd and/or serverLaunchMonitor.cmd).
[6.4] Run the server launch cmd file from within the "C:\Arma 3 - Servers\<server name>\cmd" folder (serverLaunch.cmd or serverLaunchMonitor.cmd).

**CHECK THAT SERVER HAS LAUNCHED CORRECTLY**
[7.1] Check the two pop-up windows to make sure the server launched and initiated correctly.
[7.2] Go play. :)

**RELAUNCH ALREADY DEPLOYED SERVER**
[8.0] To execute/run the already deployed server, go in to directory "C:\Arma 3 - Servers\<server name>\cmd" and execute/run one of the .cmd files (serverLaunch.cmd or serverLaunchMonitor.cmd).

Note: The following dos not have to be strictly "C:\"... but do follow the same diectory structure wherever you choose to place the installation files. (eg, "X:\serverFiles\Arma3InstallationFiles", X:\serverFiles\Arma3MainServer", "X:\serverFiles\Arma3ServerMods", "X:\serverFiles\Arma3DeployedServers")... then update the 3 cmd files for the correct paths, see [2.1].

I hope that explains how to use these scripts, and set up, deploy and run Arma 3 Servers (for within a Windows environment).

Cheers, soulkobk.
