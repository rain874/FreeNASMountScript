# FreeNASMountScript (NFS Share)
This Bash Scritp check FreeNAS over Ping and sending a MagicPack (WOL) and then mount FreeNAS (NFS Share) on Linux Debian Desktop or ohter Distribution 

# Testing: 
FreeNAS FreeNAS-11.3-U2

Debian 10.3 (Buster) 

# Please note

- Change the Variables at the beginning of the script IP, RELEASE, MOUNTPOINT, MAC, BROADCAST
- check activatet WOL support for FreeNAS
- check on FreeNAS WebInterface "Service" -> "NFS" -> "activated"
- make a NFS Share under FreeNAS WebInterface "Sharing" -> "NFS"

# Requirements

> Install this package first

```shell
$ apt-get install notify-send
$ apt-get install nfs-common portmap
```

- The network card of your FreeNAS must support WOL (wake on lan) and it must also be activated in the BIOS / UEFI uefi


# coming soon ...
FreeNASMountScript has to be registered as /etc/systemd/system for AutoStart
