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

#Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

#Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

USER=`whoami`
HOSTNAME=`hostname`
DISC1=`df -h | grep /dev/sda | awk '{print $5}'`
DISC2=`df -h | grep /dev/sda | awk '{print $4}'`
MEMORY1=`free -t -m | grep "buffers/cache" | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`
PSA=`ps -Afl | wc -l`
PSU=`ps U $USER h | wc -l`

#HDD Temp

HDD1=`hddtemp -n /dev/sda`

#System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))

#System load
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`

clear

echo ""
echo ""
echo -e "$BRed If you gain access to this server without permission logout now!! $Color_Off"
echo ""
echo ""
echo "██████╗ ██████╗  ██████╗ ███╗   ███╗███████╗████████╗██╗  ██╗███████╗██╗   ██╗███████╗"
echo "██╔══██╗██╔══██╗██╔═══██╗████╗ ████║██╔════╝╚══██╔══╝██║  ██║██╔════╝██║   ██║██╔════╝"
echo "██████╔╝██████╔╝██║   ██║██╔████╔██║█████╗     ██║   ███████║█████╗  ██║   ██║███████╗"
echo "██╔═══╝ ██╔══██╗██║   ██║██║╚██╔╝██║██╔══╝     ██║   ██╔══██║██╔══╝  ██║   ██║╚════██║"
echo "██║     ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗   ██║   ██║  ██║███████╗╚██████╔╝███████║"
echo "╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚══════╝"
echo ""
echo ""
echo -e "$Yellow [Home-Server] $Color_Off"
echo ""
echo -e "$Cyan +++++++++++++++++++++++++: $White System Data $Cyan :++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White Hostname $Red : $BCyan $HOSTNAME $Color_Off"
echo -e "$Cyan + $White Kernel $Red : $BCyan `uname -r` $Color_Off"
echo -e "$Cyan + $White Distro $Red : $BCyan `uname -m` $Color_Off"
echo -e "$Cyan + $White Processor $Red : $BCyan Intel(R) Pentium(R) CPU G630 @ 2.70GHz, 2 cores $Color_Off"
echo -e "$Cyan + $White Users $Red : $BCyan Currently `users | wc -w` users logged on $Color_Off"
echo -e "$Cyan + $White HD Temp $Red : $BCyan 320_Sys = $HDD1 ºC | $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan +++++++++++++++++++++++++: $White User Data $Cyan :++++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White Current User $Red: $BCyan $USER $Color_Off"
echo -e "$Cyan + $White CPU Usage $Red: $BCyan $LOAD1 1 min $LOAD5 5 min $LOAD15 15 min $Color_Off"
echo -e "$Cyan + $White CPU Temperature $Red: $BCyan `acpi -t | cut -f4 -d' '` C $Color_Off"
echo -e "$Cyan + $White Memory Used $Red: $BCyan $MEMORY1 / $MEMORY2 $Color_Off"
echo -e "$Cyan + $White Processes $Red: $BCyan You are running $PSU of $PSA processes $Color_Off"
echo -e "$Cyan + $White System Uptime $Red: $BCyan $upDays days $upHours hours $upMins minutes $upSecs seconds $Color_Off"
echo -e "$Cyan + $White Disk Space Used $Red: $BCyan $DISC1 $Color_Off"
echo -e "$Cyan + $White Free Disk Space $Red: $BCyan $DISC2 $Color_Off"
echo -e "$Cyan + $White IP Address $Color_Off"
echo -e "$Cyan + $White Internal: $Red: $BCyan `ifconfig eth1 | grep "inet end" | cut -d ":" -f 2 | cut -d " " -f 2` $Color_Off"
echo -e "$Cyan + $White External: $Red: $BCyan `wget -q -O - http://icanhazip.com/ | tail` $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan +++++++++++++++++++++++++: $White Report $Cyan :++++++++++++++++++++++++++ $Color_Off"
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan + $White System $Red : $BCyan $PACMAN packages can be updated $Color_Off"
maint=`cat /etc/motd-maint`
if [[ $maint = "Nothing to report" ]]; then
    echo -e "$Green Nothing to report $Color_Off"
else
    echo -e "$Red $maint $Color_Off"
fi
echo -e "$Cyan + $Color_Off"
echo -e "$Cyan +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ $Color_Off"
echo ""
