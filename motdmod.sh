#!/usr/bin/env bash

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
HOSTNAME=`uname -n`
KERNEL=`uname -r`
DISTRO=`uname -m`
CPU=`uname -p`

#Storage
DISC1=`df -h | grep /dev/sda | awk '{print $5}'`
DISC2=`df -h | grep /dev/sda | awk '{print $4}'`

#User Data
USER=`whoami`
#System Load
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`
#System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))
#ISP
INTERNALIP=`ifconfig enp0s3 | grep "inet end" | cut -d ":" -f 2 | cut -d " " -f 2`
EXTERNALIP=`wget -q -O - http://icanhazip.com/ | tail`

#Hardware
CPUTEMP=`acpi -t | cut -f4 -d' '`
MEMORYUSED=`free -t -m | grep "Mem" | awk '{print $3" MB"}'`
MEMORYTOTAL=`free -t -m | grep "Mem" | awk '{print $2" MB"}'`
PSA=`ps -Afl | wc -l`
PSU=`ps U $USER h | wc -l`

#HDD Temp
HDD1=`hddtemp -n /dev/sda`

clear

echo ""
echo ""
echo -e "$BRed If you gain access to this server without permission logout now!! $Color_Off"
echo ""
echo ""
echo "      ██████╗ ██████╗  ██████╗ ███╗   ███╗███████╗████████╗██╗  ██╗███████╗██╗   ██╗███████╗"
echo "      ██╔══██╗██╔══██╗██╔═══██╗████╗ ████║██╔════╝╚══██╔══╝██║  ██║██╔════╝██║   ██║██╔════╝"
echo "      ██████╔╝██████╔╝██║   ██║██╔████╔██║█████╗     ██║   ███████║█████╗  ██║   ██║███████╗"
echo "      ██╔═══╝ ██╔══██╗██║   ██║██║╚██╔╝██║██╔══╝     ██║   ██╔══██║██╔══╝  ██║   ██║╚════██║"
echo "      ██║     ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗   ██║   ██║  ██║███████╗╚██████╔╝███████║"
echo "      ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚══════╝"
echo ""
echo ""
echo -e "$Yellow [Home-Server] $Color_Off"
echo ""
echo -e "$Cyan +++++++++++++++++++++++++: $White System Data $Cyan :++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White Hostname......$Red: $BCyan $HOSTNAME $Color_Off"
echo -e "$Cyan + $White Kernel......$Red: $BCyan $KERNEL $Color_Off"
echo -e "$Cyan + $White Distro......$Red: $BCyan $DISTRO $Color_Off"
echo -e "$Cyan + $White CPU......$Red: $BCyan $CPU $Color_Off"
echo -e "$Cyan + $White Users......$Red: $BCyan Currently `users | wc -w` users logged on $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan +++++++++++++++++++++++++: $White Storage $Cyan :++++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White Main HD......$Red: $BCyan Size$Red: $MAINSIZE Used$Red: $MAINUSED Free$Red: $MAINFREE Temp $MAINTEMP ºC | $Color_Off"
echo -e "$Cyan + $White HD 1......$Red$Red: $BCyan Size$Red: $HD1SIZE Used$Red: $HD1USED Free$Red: $HD1FREE Temp $HD1TEMP ºC | $Color_Off"
echo -e "$Cyan + $White HD 2......$Red$Red: $BCyan Size$Red: $HD2SIZE Used$Red: $HD2USED Free$Red: $HD2FREE Temp $HD2TEMP ºC | $Color_Off"
echo -e "$Cyan + $White HD 3......$Red$Red: $BCyan Size$Red: $HD3SIZE Used$Red: $HD3USED Free$Red: $HD3FREE Temp $HD3TEMP ºC | $Color_Off"
echo -e "$Cyan + $White HD 4......$Red$Red: $BCyan Size$Red: $HD4SIZE Used$Red: $HD4USED Free$Red: $HD4FREE Temp $HD4TEMP ºC | $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan +++++++++++++++++++++++++: $White User Data $Cyan :++++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White Current User...... $Red: $BCyan $USER $Color_Off"
echo -e "$Cyan + $White CPU Usage...... $Red: $BCyan 1 Min$Red:$LOAD1 5 Min$Red: $LOAD5 15 Min$Red: $LOAD15 $Color_Off"
echo -e "$Cyan + $White System Uptime...... $Red: $BCyan $upDays days $upHours hours $upMins minutes $upSecs seconds $Color_Off"
echo -e "$Cyan + $White IP Address........................$Red: $Color_Off"
echo -e "$Cyan + $White Internal...... $Red: $BCyan $INTERNALIP $Color_Off"
echo -e "$Cyan + $White External...... $Red: $BCyan $EXTERNALIP $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan +++++++++++++++++++++++++: $White Hardware $Cyan :++++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White CPU Temperature...... $Red: $BCyan $CPUTEMP C $Color_Off"
echo -e "$Cyan + $White Memory Used/Total...... $Red: $BCyan $MEMORYUSED / $MEMORYTOTAL $Color_Off"
echo -e "$Cyan + $White Processes...... $Red: $BCyan You are running $PSU of $PSA processes $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan +++++++++++++++++++++++++: $White Report $Cyan :++++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White System......$Red : $BCyan $PACMAN packages can be updated $Color_Off"
maint=`cat /etc/motd-maint`
if [[ $maint = "Nothing to report" ]]; then
    echo -e "$Green Nothing to report $Color_Off"
else
    echo -e "$Red $maint $Color_Off"
fi
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ $Color_Off"
echo ""
