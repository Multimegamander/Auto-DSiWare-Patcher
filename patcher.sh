#!/usr/bin/env bash
echo "Welcome to the Auto-DSiWare-Patcher! With this patcher you can patch a DSiWare .app and/or an NDS ROM (.nds)! Make sure that your NDS and/or app is in the same directory as this patcher.sh!"
echo "You need mono, so make sure mono is installed!"
echo "Smash sat Enter button to continue."
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
echo "Searching for all dos .nds ROMS..."
if [ ! -e *.nds ]
then
    if [ ! -e *.app ]
	then
	    echo "No NDS Rom/ DSiWare app found!"
		echo "Smash dat enter button to exit."
		read
		exit 0
    fi
fi
if [ -e *.nds ]
then
    for f in *.nds
    do
        echo "Processing $f..."
        echo "Patching... This might take a hot second."
        mono WfcPatcher.exe --domain wiimmfi.de "$f"
        echo "Patch complete, you a fuckin' PRO hacker now m8!"
    done
fi
echo "Searching .app DSiWares..."
if [ -e *.app ]
then
    for h in *.app
    do
        echo "Processing $h..."
        echo "Patching... This might take a hot second."
        mono WfcPatcher.exe --domain wiimmfi.de "$h"
        echo "Patch complete, you a fuckin' PRO hacker now m8!"
    done
fi
sleep 5
clear
echo "Patching complete, enjoy the interwebz on these old ass stale consoles, jk, I love the DS/DSi!"
echo "Smash dat Enter buttom to GTFO!"
read
exit 0
