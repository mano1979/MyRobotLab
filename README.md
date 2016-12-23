# MyRobotLab
Installer script for using MyRobotLab with the Raspberry Pi Camera module

After spending a year searching the internet for a solution to use the Raspberry Pi camera module (CSI) with OpenCV in MyRobotlab, i finally found a post that had some info that accually worked!

In my excitement i wrote a bash script that will install all needed packages to get it working and download the MRL application.

Just run the script from the Pi's terminal like this: 

user@pi:$ wget http://raw.githubusercontent.com/mano1979/MyRobotLab/master/MRL.sh

and run it with:

user@pi:$ sh MRL.sh

You have a few options that you have to answer with [Y/n]

That is all! Enjoy!
