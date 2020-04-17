# FreeNASMountScript (NFS Share)
This Bash Scritp check FreeNAS over Ping and sending a MagicPack (WOL) and then mount FreeNAS (NFS Share) on Linux Debian Desktop or ohter Distribution 

# Testing: 
FreeNAS FreeNAS-11.3-U2

Debian 10.3 (Buster) 

# Please note
change the Variables at the beginning of the script IP, RELEASE, MOUNTPOINT, MAC, BROADCAST
check activatet WOL support for FreeNA
check on FreeNAS Webinterface "Service" -> "NFS" -> "activated"
make a NFS Share under FreeNAS WebInterface "Sharing" -> "NFS"

# Requirements
apt-get install notify-send

apt-get install nfs-common portmap

The network card of your FreeNAS must support WOL (wake on lan) and it must also be activated in the BIOS / UEFI uefi

## Donations (Thanks)

- <a href="https://cdn.rawgit.com/gratipay/gratipay-badge/2.3.0/dist/gratipay.png" target="_blank">Thanks</a> 

[![Support via PayPal](https://cdn.rawgit.com/gratipay/gratipay-badge/2.3.0/dist/gratipay.png)](https://gratipay.com/fvcproductions/)


FreeNASMountScript has to be registered as /etc/systemd/system for AutoStart
# coming soon ...
