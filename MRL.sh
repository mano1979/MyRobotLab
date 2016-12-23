#!/bin/sh
cd
clear
echo "                                                                                "
echo "                                                                                "
echo "                                                                                "  
echo "                                     ;;;;;                                      "
echo "                                     ;   '                                      "
echo "                                     ;   '                                      "
echo "                                     ;   '                                      "
echo "                                    +,,,,,'                                     "
echo "                                    @@@;@@@                                     "
echo "                                   '@@   @@;                                    "
echo "                                   @@@  ,@@@                                    "
echo "                                   @:     @@                                    "
echo "                                  :@;     @@:                                   "
echo "                                  @@#    , @@                                   "
echo "                                 +@@@@ @ @@@@@                                  "
echo "                                 @@@@@ @ @@@@@                                  "
echo "                                 @@@@'   {@@@@                                  "
echo "                                  #@@@@@@@@@@                                   "
echo "                                                                                "
echo "         __  __       _____       _           _   _           _                 "    
echo "        |  \/  |     |  __ \     | |         | | | |         | |                " 
echo "        | \  / |_   _| |__) |___ | |__   ___ | |_| |     __ _| |__              "
echo "        | |\/| | | | |  _  // _ \| '_ \ / _ \| __| |    / _' | '_ \             "
echo "        | |  | | |_| | | \ \ (_) | |_) | (_) | |_| |___| (_| | |_) |            "
echo "        |_|  |_|\__, |_|  \_\___/|_,__/ \___/ \__|______\__,_|_,__/             "
echo "                 __/ /                                                          "
echo "                |___/                                                           "
echo "                                                                                "
echo "                           INSTALLER SCRIPT                                     "
echo "                                                                                "
echo "        For use with the \"Raspberry Pi (CSI) Camera Module\" in MRL            "
echo "                                                                                "
echo "                           by Mano Biletsky                                     "
echo "                                                                                "
echo "                                                                                "
echo "                                                                                "
echo "          This script assumes you have the RPi camera installed,                "
echo "and enabled in 'raspi-config'. You can test it by typing 'raspivid -t 30000'    "
echo "      If you haven't done this yet, choose 'No (n)' below and do it!            "
echo "                                                                                "
echo "                                                                                "
read -r -p "Do you want to install all needed packages for MRL? [Y/n]" CONT
if [ "$CONT" = "y" ]; then
    sudo apt-get update
    sudo apt-get -y install v4l2
    echo "Editing the rc.local file to load the camera module driver at boot"
    sudo replace "exit 0" "sudo modprobe bcm2835-v4l2\n\nexit 0" --  /etc/rc.local
    sudo apt-get -y install build-essential cmake pkg-config libpng12-0 libpng12-dev libpng++-dev libpng3
    sudo apt-get -y install libpnglite-dev zlib1g-dbg zlib1g zlib1g-dev pngtools libtiff4-dev
    sudo apt-get -y install libtiff4 libtiffxx0c2 libtiff-tools libjpeg8 libjpeg8-dev libjpeg8-dbg libjpeg-progs ffmpeg libavcodec-dev
    echo "These next packages can cause some errors:  "
    echo "libavcodec54 libavformat54 ibavcodec53 libavformat53 libavformat-dev"
    echo "                    "
    echo "If they are, just remove them from this script line below and try"
    echo "running this script again. In my case they were allready in the Raspbian image"
    echo " "
    echo "line 60: sudo apt-get -y install libavcodec54 libavformat54 ibavcodec53 libavformat53 libavformat-dev libgstreamer0.10-0-dbg libgstreamer0.10-0 libgstreamer0.10-dev"
    sudo apt-get -y install libavcodec54 libavformat54 ibavcodec53 libavformat53 libavformat-dev libgstreamer0.10-0-dbg libgstreamer0.10-0 libgstreamer0.10-dev
    sudo apt-get -y install libxine1-ffmpeg libxine-dev libxine1-bin libunicap2 libunicap2-dev libdc1394-22-dev libdc1394-22 libdc1394-utils
    sudo apt-get -y install swig libv4l-0 libv4l-dev
    sudo apt-get -y install libpng-dev libjpeg-dev libxxf86vm1 libxxf86vm-dev libxi-dev libxrandr-dev
    sudo apt-get -y install mesa-common-dev
    sudo apt-get -y install mesa-utils-extra libgl1-mesa-dev libglapi-mesa
    sudo apt-get -y install libgles2-mesa-dev
    sudo apt-get -y install freeglut3 freeglut3-dbg freeglut3-dev libmgl-glut5
    sudo apt-get -y install libxmu-dev libxi-dev
    sudo apt-get -y install libudev-dev
    clear
    echo "                                                                           "
    echo "                                                                           "
    echo "                                                                           "  
    echo "                    Downloading MyRobotLab java app now...                 "
    wget https://github.com/MyRobotLab/myrobotlab/releases/download/1.0.1758/myrobotlab.jar
    echo "                                                                           "
    echo "               Application is located in /home/pi/myrobotlab.jar           "
    echo "                                                                           "
    echo "	                   _____   ____  _   _ ______   _  		     "
    echo "	                  |  __ \ / __ \| \ | |  ____| | | 		     "
    echo "	                  | |  | | |  | |  \| | |__    | | 		     "
    echo "	                  | |  | | |  | | n u |  __|   | | 		     "
    echo "	                  | |__| | |__| | |\  | |____  |_| 		     "
    echo "	                  |_____/ \____/|_| \_|______| (_) 		     "
    echo "	                                                                     "                             
    echo "             Start MyRobotLab by typing: java -jar myrobotlab.jar          "
    echo "                                                                           "
    read -r -p "Auto-start MyRobotLab at boot? [Y/n]" CONT2
    if [ "$CONT2" = "y" ]; then
        sudo replace "exit 0" "java -jar myrobotlab.jar\n\nexit 0" --  /etc/rc.local
    fi
    read -r -p "System needs to be rebooted!   Reboot now? [Y/n]" CONT3
    if [ "$CONT3" = "y" ]; then
        sudo reboot
    else
        exit 0
    fi
else
    clear
    echo "                                                                           "
    echo "                                                                           "
    echo "                                                                           "  
    echo "                                                                           "
    echo "                                                                           "  
    echo "                                                                           "
    echo "                                                                           "
    echo "  _______ ______ _____  __  __ _____ _   _       _______ ______ _____    _ "
    echo " |__   __|  ____|  __ \|  \/  |_   _| \ | |   /\|__   __|  ____|  __ \  | |"
    echo "    | |  | |__  | |__) | \  / | | | |  \| |  /  \  | |  | |__  | |  | | | |"
    echo "    | |  |  __| |  _  /| |\/| | | | | n u | / /\ \ | |  |  __| | |  | | | |"
    echo "    | |  | |____| | \ \| |  | |_| |_| |\  |/ ____ \| |  | |____| |__| | |_|"
    echo "    |_|  |______|_|  \_\_|  |_|_____|_| \_/_/    \_\_|  |______|_____/  (_)"
    echo "                                                                           "
    echo "                          Install terminated by user                       "
    echo "                                                                           "
    echo "                                                                           "
fi
