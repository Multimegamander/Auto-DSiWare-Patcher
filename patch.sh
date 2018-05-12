#!/usr/bin/env bash
#Auto-DSiWare-Patcher
echo "Welcome to the Auto-DSiWare-Patcher! With this patcher you can patch a DSiWare .app and/or an NDS ROM (.nds)! Make sure that your NDS and/or app is in the same directory as this patcher.sh!"
echo "You need mono, so make sure mono is installed!"
echo "Hit Enter to continue."
read
clear
echo "Loading..."
sleep 2
if [ ! -f ./WfcPatcher.exe ]; then
    clear
    echo "FATAL ERROR! WfcPatcher.exe not found!"
    echo "Exiting..."
    sleep 3
    clear
    exit 0
fi
echo "Searching .nds ROMS..."
if [ -e *.nds ]
then
    for f in *.nds
    do
        echo "Processing $f..."
        echo "Patching... This might take a second."
        mono WfcPatcher.exe --domain wiimmfi.de "$f"
        echo "Patch complete!"
    done
else
    echo "No NDS Files found :/"
fi
echo "Searching .app DSiWares..."
if [ -e *.app ]
then
    for h in *.app
    do
        echo "Processing $h..."
        echo "Patching... This might take a second."
        mono WfcPatcher.exe --domain wiimmfi.de "$h"
        echo "Patch complete!"
    done
else
    echo "No app Files found :/"
fi
sleep 5
clear
echo "Patching complete!"
echo "Hit Enter to exit!"
read
exit 0