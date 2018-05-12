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

:nds_present
color 0F
cls
if %cor%==0 echo Let's begin.
if %cor%==1 echo Let's begin.
echo.
echo Patching NDS roms...
set modul=NUL
set /a patching_file=1
for %%f in ("*.nds") do set /a file_counter+=1
set /a repeat=1
set /a errorrep=0
set /a rep=0
cls
for %%f in ("*.nds") do (
echo Patching file [!patching_file!] out of [%file_counter%]
echo File name: %%~nf
echo.
set modul=WfcPatcher.exe
if not exist WfcPatcher.exe goto wfcpatchfail
WfcPatcher.exe --domain wiimmfi.de "%%f">NUL
cls
echo Press Enter to continue
pause >NUL
)
echo Patching nds Roms is done. Now patching DSiWare app files...
set modul=NUL
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
WfcPatcher.exe --domain wiimmfi.de "%%f">NUL
cls
echo Patching Complete!
echo Press Enter to continue
pause >NUL
)
goto exit_patcher

:wfcpatchfail
set fail=0
if not exist WfcPatcher.exe set fail=1
goto error_patching

:error_patching
set /a patchingok=0
color 4F
cls
echo     /---\    ERROR!
echo    /     \  
echo   /   !   \  There was an error while patching.
echo  /         \ 
echo  ----------- Failing module: %modul%
echo.
if %fail%==1 echo Please check that WfcPatcher.exe is in the same directory than patcher.bat.
if %fail%==1 echo Press Enter To exit.
if %fail%==1 pause >NUL
if %fail%==1 goto exit_patcher
echo Unknown Failure. Try downloading the patcher again and extract every file out of it.
echo Press Enter To exit.
pause >NUL
goto exit_patcher

:exit_patcher
cls
color 0F
if %patchingok%==1 echo Patched Files have a (wiimmfi.de) in the name. Use them if you want to use the Patched Game.
echo Exiting the patcher in...
if %exiting%==10 echo :----------: 10
if %exiting%==9 echo :--------- : 9
if %exiting%==8 echo :--------  : 8
if %exiting%==7 echo :-------   : 7
if %exiting%==6 echo :------    : 6
if %exiting%==5 echo :-----     : 5
if %exiting%==4 echo :----      : 4
if %exiting%==3 echo :---       : 3
if %exiting%==2 echo :--        : 2
if %exiting%==1 echo :-         : 1
if %exiting%==0 echo :          :0
if %exiting%==0 echo Bye!
if %exiting%==0 exit /b 0
ping localhost -n 2 >NUL
set /a exiting=%exiting%-1
goto exit_patcher


:startimage
echo.
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
echo                           -                                        Auto DSiWare Patcher                                            -
echo                           -                                                                                                        -
echo                           -                                       Hit Enter to Continue!                                           -
echo                           -                                                                                                        -
echo                           ----------------------------------------------------------------------------------------------------------
echo                          #$#########$($$#$$$#####$$@@@@@@@@@@@@@@@@@@@@@@@@@@@#$$$#$$##@@@@@@@@@@@###$$#####$##$$$$$$$$$$$$$$$##
echo                         #$#$$#$###@@$$#########$$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$$#$$$##@@@@@@@@@@###$$####$$$$#($$$$$$$##
echo                        $$#$#$#$#$#####$$$$###$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#$$$#$$$#@@@@@@@@@@###$$######$$$###*#/
echo                      $$$#$$#$$##$$$$$$$$#####$$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$$$##$#@@@@@@@@@@###$$$##*#/
echo                   #$$$#$$$$$$$$$$$$$$$$###$$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$(((#$$$$$$$$$$$$$$$$#@#*#/
echo                  $$$$$$$$$$$$$$$$$$$$####$##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$(/(#$$$$$$$#############*/
echo                 $$$$$$$$$$$$$##($(*####$$$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$(/(#$$$$$#$#/#(#########*/
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
echo                                                                  #$$$$#########$$$$$$$#(//(#$###((((############(*
echo                                                                        #$$$$#########$$$########################*
echo                                                                              $$$$$#########$$##################*
echo                                                                                    #$$$$$#######$$$###########**
echo                                                                                          #$$@@#$$$$$$$$$#####*/
echo                                                                                                #$#@$$$$$$$##(*
echo                                                                                                      ######(/ 
echo.
echo.
pause >NUL
cls
goto no_files_present