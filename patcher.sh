#!/usr/bin/env bash
echo "Welcome to the Auto-DSiWare-Patcher! With this patcher you can patch a DSiWare Rom (.app) and/or a DS ROM (.nds)! Make sure that your NDS and/or DsiWare ROM is in the same directory as this patcher.sh!"
echo "You need mono, so make sure mono is installed!"
echo "Press [ENTER] to continue."
read
clear
echo "Loading..."
sleep 2
if [ ! -f ./WfcPatcher.exe ]; then
    clear
    echo "Error: WfcPatcher.exe not found!"
    echo "Exiting..."
    sleep 3
    clear
    exit 0
fi
echo "Searching for .nds ROMS..."
if [ ! -e *.nds ]
then
    if [ ! -e *.app ]
	then
	    echo "No DS Rom / DSiWare Rom found!"
		echo "Press [ENTER] to exit."
		read
		exit 0
    fi
fi
if [ -e *.nds ]
then
    for f in *.nds
    do
        echo "Processing $f..."
        echo "Patching... This might take a second."
        mono WfcPatcher.exe --domain wiimmfi.de "$f"
        echo "Patch complete, win at MKDS!"
    done
fi
echo "Searching .app DSiWares..."
if [ -e *.app ]
then
    for h in *.app
    do
        echo "Processing $h..."
        echo "Patching... This might take a second."
        mono WfcPatcher.exe --domain wiimmfi.de "$h"
        echo "Patch complete, play online!"
    done
fi
sleep 5
clear
echo "Patching complete! The patched binarys have a '(wiimmfi.de)' in their name, so if you want to use the patched ones, remove that '(wiimmfi.de)' and use them instead."
echo "Press [ENTER] to exit!"
read
exit 0
