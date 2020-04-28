# FreeNASMountScript (NFS Share)
This bash script checks the availibility of FreeNAS within the network by sending a ping. If
FreeNAS is not reachable, MagiPack (Work on LAN) will be sent to start FreeNAS. In case
it is reachable the NFS Share will be bound to the Debian Filesystem.

# Testing: 
FreeNAS FreeNAS-11.3-U2

Debian 10.3 (Buster) 

# Please note
- Change the variable IP, RELEASE, MOUNTPOINT, MAC, BROADCAST in the beginning of the script. If needed also change the variable PORT.
- Check if WOL is activated within your FreeNAS. Please check the motherboard
manual.
- Check the status of the NFS service in your FreeNAS Webinterface
„Service“ → „NFS“ → „activated“
- Check the status of NFS Share within your FreeNAS Webinterface
„Sharing“ → „NFS“

# Requirements
To use the sripct following packages are needed:

> Install this package first

```shell
$ apt-get install notify-send
$ apt-get install nfs-common portmap
```
- The FreeNAS network adapter has to support WOL (wake on LAN) and needs to be activated in BIOS/UEFI 

# Create .service file for AutoStart
First, a .service file must be created under /etc/systemd/system, e.g. with the file name freeNASmount.service. This file has to be edited with an editor with root access accordingly to  following content:

```bash

[Unit]
Description=FreeNASMountScript
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/root/freeNASmount.sh

[Install]
WantedBy=multi-user.target


```
Perform following 3 commands:
#  systemctl Enable
```bash
systemctl enable freeNASmount.service
```
#  systemctl Start
```bash
systemctl start freeNASmount.service
```
#  systemctl Check Status
```bash
systemctl status freeNASmount.service
```
At this point, NFS Share should be bound to the filesystem.

# FreeNASMountScript Logging
A logfile with timestamp will be place in the following path: /var/log/freeNASmount.log

#  Donations

Please feel free to send any question or remark to webmaster@itexem.de . 
Support via PayPal is appreciated.
   
- Thanks for you Support <a href="https://www.paypal.me/bashBACKUPPER" target="_top">PayPal</a>
