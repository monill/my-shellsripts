#!/bin/bash

#Reset
Color_Off='\033[0m'       #Text reset

#Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

#Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

#System Data
NAME=$(uname -n)
KERNEL=$(uname -r)
DISTRO=$(uname -m)
CPU=$(cat /proc/cpuinfo | grep 'model name')
USERS=$(users | wc -w)

#Storage
#HD0
HD0SIZE=$(df -h | grep /dev/sda | awk '{print $2}')
HD0USED=$(df -h | grep /dev/sda | awk '{print $5}')
HD0FREE=$(df -h | grep /dev/sda | awk '{print $4}')
HD0TEMP=$(hddtemp -n /dev/sda)
#HD1
HD1SIZE=$(df -h | grep /dev/sdb | awk '{print $2}')
HD1USED=$(df -h | grep /dev/sdb | awk '{print $5}')
HD1FREE=$(df -h | grep /dev/sdb | awk '{print $4}')
HD1TEMP=$(hddtemp -n /dev/sdb)
#HD2
#HD2SIZE=$(df -h | grep /dev/sdc | awk '{print $2}')
#HD2USED=$(df -h | grep /dev/sdc | awk '{print $5}')
#HD2FREE=$(df -h | grep /dev/sdc | awk '{print $4}')
#HD2TEMP=$(hddtemp -n /dev/sdc)
#HD3
#HD3SIZE=$(df -h | grep /dev/sdd | awk '{print $2}')
#HD3USED=$(df -h | grep /dev/sdd | awk '{print $5}')
#HD3FREE=$(df -h | grep /dev/sdd | awk '{print $4}')
#HD3TEMP=$(hddtemp -n /dev/sdd)
#HD4
#HD4SIZE=$(df -h | grep /dev/sde | awk '{print $2}')
#HD4USED=$(df -h | grep /dev/sde | awk '{print $5}')
#HD4FREE=$(df -h | grep /dev/sde | awk '{print $4}')
#HD4TEMP=$(hddtemp -n /dev/sde)

#User Data
USER=$(whoami)
#System Load
LOAD1=$(cat /proc/loadavg | awk {'print $1'})
LOAD5=$(cat /proc/loadavg | awk {'print $2'})
LOAD15=$(cat /proc/loadavg | awk {'print $3'})
#System uptime
uptime=$(cat /proc/uptime | cut -f1 -d.)
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))
#ISP
INTERNALIP=$(ifconfig enp0s3 | grep "inet end" | cut -d ":" -f 2 | cut -d " " -f 2)
EXTERNALIP=$(wget -q -O - http://icanhazip.com/ | tail)

#Hardware
CPUTEMP=$(acpi -t | cut -f 4 -d ' ')
MEMORYUSED=$(free -t -m | grep "Mem" | awk '{print $3" MB"}')
MEMORYTOTAL=$(free -t -m | grep "Mem" | awk '{print $2" MB"}')
PSA=$(ps -Afl | wc -l)
PSU=$(ps U ${USER} h | wc -l)

#Report
PACMAN=$(0)
maint=$(cat /etc/motd-maint)

clear

echo ""
echo ""
echo -e "$BRed      If you gain access to this server without permission logout now!! $Color_Off"
echo ""
echo "       ______                         _   _                     "
echo "       | ___ \                       | | | |                    "
echo "       | |_/ / __ ___  _ __ ___   ___| |_| |__   ___ _   _ ___  "
echo "       |  __/ '__/ _ \| '_   _ \ / _ \ __| '_ \ / _ \ | | / __| "
echo "       | |  | | | (_) | | | | | |  __/ |_| | | |  __/ |_| \__ \ "
echo "       \_|  |_|  \___/|_| |_| |_|\___|\__|_| |_|\___|\__,_|___/ "
echo ""
echo ""
echo -e "$Cyan +++++++++++++++++++++++++: $White System Data $Cyan :++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White Hostname......$Red: $BCyan $NAME $Color_Off"
echo -e "$Cyan + $White Kernel........$Red: $BCyan $KERNEL $Color_Off"
echo -e "$Cyan + $White Distro........$Red: $BCyan $DISTRO $Color_Off"
echo -e "$Cyan + $White CPU...........$Red: $BCyan $CPU $Color_Off"
echo -e "$Cyan + $White Users.........$Red: $BCyan Currently $USERS users logged on $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan ++++++++++++++++++++++++++: $White Storage $Cyan :+++++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White HD 0......$Red: $BCyan Size$Red: $Green $HD0SIZE $BCyan Used$Red: $Green $HD0USED $BCyan Free$Red: $Green $HD0FREE $BCyan Temp $Green $HD0TEMP $BCyan ºC $Color_Off"
echo -e "$Cyan + $White HD 1......$Red: $BCyan Size$Red: $Green $HD1SIZE $BCyan Used$Red: $Green $HD1USED $BCyan Free$Red: $Green $HD1FREE $BCyan Temp $Green $HD1TEMP $BCyan ºC $Color_Off"
#echo -e "$Cyan + $White HD 2......$Red: $BCyan Size$Red: $Green $HD2SIZE $BCyan Used$Red: $Green $HD2USED $BCyan Free$Red: $Green $HD2FREE $BCyan Temp $Green $HD2TEMP $BCyan ºC $Color_Off"
#echo -e "$Cyan + $White HD 3......$Red: $BCyan Size$Red: $Green $HD3SIZE $BCyan Used$Red: $Green $HD3USED $BCyan Free$Red: $Green $HD3FREE $BCyan Temp $Green $HD3TEMP $BCyan ºC $Color_Off"
#echo -e "$Cyan + $White HD 4......$Red: $BCyan Size$Red: $Green $HD4SIZE $BCyan Used$Red: $Green $HD4USED $BCyan Free$Red: $Green $HD4FREE $BCyan Temp $Green $HD4TEMP $BCyan ºC $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan +++++++++++++++++++++++++: $White User Data $Cyan :++++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White Current User.......$Red: $BCyan $USER $Color_Off"
echo -e "$Cyan + $White CPU Usage..........$Red: $BCyan 1 Min$Red: $Green $LOAD1 5 Min$Red: $Green $LOAD5 15 Min$Red: $Green $LOAD15 $Color_Off"
echo -e "$Cyan + $White System Uptime......$Red: $BCyan $upDays days $upHours hours $upMins minutes $upSecs seconds $Color_Off"
echo -e "$Cyan + $White ........................IP Address........................ $Color_Off"
echo -e "$Cyan + $White Internal......$Red: $BCyan $INTERNALIP $Color_Off"
echo -e "$Cyan + $White External......$Red: $BCyan $EXTERNALIP $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan ++++++++++++++++++++++++++: $White Hardware $Cyan :++++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White CPU Temperature........$Red: $BCyan $CPUTEMP ºC $Color_Off"
echo -e "$Cyan + $White Memory Used/Total......$Red: $BCyan $MEMORYUSED / $MEMORYTOTAL $Color_Off"
echo -e "$Cyan + $White Processes..............$Red: $BCyan You are running $PSU of $PSA processes $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan ++++++++++++++++++++++++++: $White Report $Cyan :++++++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White System......$Red : $BCyan $PACMAN packages can be updated $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ $Color_Off"
echo ""
