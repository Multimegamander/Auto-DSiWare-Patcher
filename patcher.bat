@ECHO OFF
TITLE Auto DSiWare-Patcher
COLOR 0F

set /a exiting=10
set /a repeat=1
set /a errorrep=0
set /a rep=0
set /a cor=0
set /a patchingnumber=1
set /a patchingok=1
set nonds=0
cls
color F0
mode 150,55
echo.
echo.
echo                                                $####$$#$#
echo                                               #$$############$$###
echo                                               $$$#####################$#(#
echo                                               $$##############################$$###
echo                                              ##$#######################################$$(##
echo                                              ($###################@$$$$$#@@@###################$$###
echo                                             ##$###################@$$$$$$$$$$$$$##@@#$$$$$##$$$$$#######$$###
echo                                             ($###################@$$$$$$$$$$$$$$$$$$$$$$$#@@#$$$$$##$$$$$$$#####$$#(#
echo                                            $#$###################@###$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#@#$$$$$$#$$$$$$$$$$$#$$$###
echo                                            (####################@#######$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$####$$$$#$$$$$$$$$$$$$$$$#(#
echo                                           $#$#################$#@########$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#$$$$$#######$$$#$$$$$$$$#
echo                                           ##################################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#$##$#$#######$$$
echo                                          $#$#################$#@#############$#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#$$$$$$$$$$$###########$$$#
echo                                          #######################################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$##########$$#(
echo                                         $#$###################@###################$$$$$$$$$$$$$$$$$$$$$$$$$$@$$$$$$$$$$$$##########$$$#
echo                                         ###########################################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$########$$$$
echo                                        $########$##########@#######################$#$$$$$$$$$$$$$$$$$$$$#$#$$$$$$$$$$$$$#######$$$##
echo                                        $#$###################@##########################$$$$$$$$$$$$$$$$$$$#$$$$$$$$$$$$$$$$$####$$$$
echo                                        #$###################@#############################$$$$$$$$$$$$$$$$@$#$$$$$$$$$$$$$$$$###$$$$#
echo                                       $#$##/#$##############@###############################$$$$$$$$$$$$$$#$$$$$$$$$$$$$$$$$####$$$$
echo                           ----------------------------------------------------------------------------------------------------------
echo                           -                                                                                                        -
echo                           -                                         Auto DSiWare Patcher                                           -
echo                           -                                                                                                        -
echo                           -                                      Press [ENTER] to continue!                                        -
echo                           -                                                                                                        -
echo                           ----------------------------------------------------------------------------------------------------------
echo                          #$#########$($$#$$$#####$$@@@@@@@@@@@@@@@@@@@@@@@@@@@#$$$#$$##@@@@@@@@@@@###$$#####$##$$$$$$$$$$$$$$$##
echo                         #$#$$#$###@@$$#########$$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$$#$$$##@@@@@@@@@@###$$####$$$$#($$$$$$$##
echo                        $$#$#$#$#$#####$$$$###$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#$$$#$$$#@@@@@@@@@@###$$######$$$###*#/
echo                      $$$#$$#$$##$$$$$$$$#####$$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$$$##$#@@@@@@@@@@###$$$##*#/
echo                   #$$$#$$$$$$$$$$$$$$$$###$$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$(((#$$$$$$$$$$$$$$$$#@#*#/
echo                  $$$$$$$$$$$$$$$$$$$$####$##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$(/(#$$$$$$$#############*/
echo                 $$$$$$$$$$$$$##($(*####$$$@@@@@@@@@@@@@@@@@@@@Hello, World@@@@@@@@@@@@@@@@@@@@@@$$(/(#$$$$$#$#/#(#########*/
echo                 $##$#$$$$$$$$$$$$$($##$$(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$(/(#$#(#$$$@$#/$########/*
echo                  ########$#$$$$$$$###$###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$(/(#$@$(/$#####$$#######(*
echo                   $$###########$#$$#####$$$##$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$(/(######$$$####$(##($##(*
echo                        #$$###########$#$$#####$$$$$$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$(//(####$#$#(#(##$##$####*
echo                              #$$###########$#$$$$$##$$$$$$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$(//(######$$@$#$#########*
echo                                    #$$###########$$$$$$$##$$$$$$$@@@@@@@@@@@@@@@@@@@@@@@@@$$(//(#####################*
echo                                          $$$###########$$$$$$$$$$$$$$$$@@@@@@@@@@@@@@@@@@$$(//(#####################*
echo                                                #$$$##########$$$$$$$$$$$$$$$$#@@@@@@@@@@$$(/(#$#/##################/*
echo                                                      #$$$##########$$$$$$$$$$$$$$$$#@@@$$(//(#######((############(*
echo                                                            #$$$##########$$$$$$$$$$$#$$$(/(#$#(##################(*
echo                                                                  #$$$$#########$$$$$$$#(//(#$###((((############(*/
echo                                                                        #$$$$#########$$$#########################*
echo                                                                              $$$$$#########$$##################*/
echo                                                                                    #$$$$$#######$$$###########**
echo                                                                                          #$$@@#$$$$$$$$$#####*/
echo                                                                                                #$#@$$$$$$$##(*
echo                                                                                                      ######(/ 
echo.
echo.
pause >NUL
cls

mode 130,35
color 0F
cls
echo Let's begin.
ping 127.0.0.1 -n 3 >NUL
echo.
echo Searching for DS/DSi games...

if not exist "*.nds" (
   set nonds=1
   if not exist "*.app" goto no_files_present
)

if exist *.nds (
   echo.
   echo Patching NDS Roms...
   set modul=no module
   set /a patching_file=1
   for %%h in ("*.nds") do set /a file_counter+=1
   set /a repeat=1
   set /a errorrep=0
   set /a rep=0
   cls
   for %%h in ("*.nds") do (
      echo Patching file [!patching_file!] out of [%file_counter%]
      echo File name: %%~nh
      set modul=WfcPatcher.exe
      if not exist WfcPatcher.exe goto wfcpatchfail
      WfcPatcher.exe --domain wiimmfi.de "%%h"
      cls
   )
)
if exist *.app (
   if %nonds%==0 echo Patching nds Roms is done. Now patching DSiWare app files...
   if %nonds%==1 echo Patching DSiWare... 
   set modul=no module
   set /a patching_file=1
   for %%f in ("*.app") do set /a file_counter+=1
   set /a repeat=1
   set /a errorrep=0
   set /a rep=0
   cls
   for %%f in ("*.app") do (
      echo Patching file [!patching_file!] out of [%file_counter%]
      echo File name: %%~nf
      echo.
      set modul=WfcPatcher.exe
      if not exist WfcPatcher.exe goto wfcpatchfail
      WfcPatcher.exe --domain wiimmfi.de "%%f"
      cls
      echo Patching Complete!
      echo Press [ENTER] to continue!
      pause >NUL
   )
)
goto exit_patcher

:wfcpatchfail
set fail=0
if not exist WfcPatcher.exe set fail=1
goto error_patching

:no_files_present
set fail=2

:error_patching
set /a patchingok=0
color 4F
cls
echo.
echo      /-\     Uh-Oh!
echo     /   \    
echo    /     \   There was an error while patching.
echo   /   !   \  
echo  /         \ Failing module: %modul%
echo  ----------- 
echo.
if %fail%==1 echo Please check that WfcPatcher.exe is in the same directory than patcher.bat.
if %fail%==1 echo Press [ENTER] To exit.
if %fail%==1 pause >NUL
if %fail%==1 goto exit_patcher
if %fail%==2 echo No nds or app files found. Please put your nds roms / app files into the same directory ar the patcher.bat.
if %fail%==2 echo Press [ENTER] To exit.
if %fail%==2 pause >NUL
if %fail%==2 goto exit_patcher
echo Unknown Failure. Try downloading the patcher again and extract every file out of it.
echo Press [ENTER] To exit.
pause >NUL

:exit_patcher
cls
color 0F
if %patchingok%==1 echo Patched Files have a (wiimmfi.de) in the name. Use those patched files if you want to play online.
echo Exiting the patcher in...
if %exiting%==3 echo :---       : 3
if %exiting%==2 echo :--        : 2
if %exiting%==1 echo :-         : 1
if %exiting%==0 echo :          : 0
if %exiting%==0 echo Bye!
if %exiting%==0 ping localhost -n 2 >NUL
if %exiting%==0 exit /b 0
ping localhost -n 2 >NUL
set /a exiting=%exiting%-1
goto exit_patcher
