# FreeNASMountScript (SMB Share)

This Bash Scritp check FreeNAS over Ping and Mount FreeNAS (SMB Share) on Linux Debian Desktop or ohter Distribution 

# Testing: 
Server:
FreeNAS FreeNAS-11.3-U2

Client:
Debian 10.3 (Buster) 

# One Step
Please change the Variables at the beginning of the script IP, RELEASE, MOUNTPOINT, MAC, BROADCAST

# Two Step
The network card of your FreeNAS must support WOL (wake on lan) and it must also be activated in the BIOS / UEFI uefi

FreeNASMountScript has to be registered as /etc/systemd/system 
# coming soon ...
