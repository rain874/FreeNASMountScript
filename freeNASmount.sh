#!/bin/sh
echo "-----------------------------------------------------------------------"
echo "------------  FreeNASMountScript, Copyright (c) 2020 ------------------"
echo "------------  Version 0.1                            ------------------"
echo "------------                       Rainer Schmitz    ------------------"
echo "------------                   All right reserved.   ------------------"
echo "-----------------------------------------------------------------------"
echo "------------  This program is licensed under the GNU   ----------------"
echo "------------  General Public License.                  ----------------"
echo "------------  FreeNASMountScript comes wiht ABSOLUTELY ----------------" 
echo "------------  NO WARRENTY, to the extent permitted   ------------------"
echo "------------  by applicable law.                     ------------------"
echo "-----------------------------------------------------------------------"

datum=$(date +'%Y.%m.%d %H:%M:%S | ')
# this is the IP From FreeNAS
IP="0.0.0.0"

# change the sharing path
RELEASE="/mnt/Server/share"

# change the mounting point
MOUNTPOINT="/home/user/freeNAS"

# Please note: The network card of your FreeNAS must support WOL (wake on lan) and it must also be activated in the BIOS / UEFI uefi
# change the mac 
MAC=00:00:00:00:00:00
# change the Broadcast Adresss
BROADCAST=1.0.0.0
# Port 80 is the Default you can't changed of port 443 if freeNAS only supports SSL
PORT=80

ping -c1 $IP 2>/dev/null 1>/dev/null
if [ "$?" = 0 ]
then
  echo -e $datum $IP "| Host found, now mounting" >> /var/log/freeNASmount.log
  mount $IP:$RELEASE $MOUNTPOINT
  su unixben -c 'notify-send -t 20000 "Info" "FreeNAS wurde oder ist gemountet"' 
else
  echo -e $datum $IP "| Host not Found, sending a MagicPacket (WOL), please restart the Script in 5-10 min" >> /var/log/freeNASmount.log
  su unixben -c 'notify-send -t 20000 "Warnung" "FreeNAS wurde nicht gemountet"' 
  echo -e $(echo $(printf 'f%.0s' {1..12}; printf "$(echo $MAC | sed 's/://g')%.0s" {1..16}) | sed -e 's/../\\x&/g') | nc -w1 -u -b $BROADCAST $PORT
fi

