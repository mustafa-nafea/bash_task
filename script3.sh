#!/bin/bash

#connecting using warp
echo "connecting to warp"
warp-cli connect
sleep 5

#check the status of the connection
warp-cli status | grep -q Connected
if [[ $? -eq 0 ]]; then
	echo "Warp Connected...." 
else
	echo "failed to connect...."
	exit
fi

#connecting the openvpn in the background
echo "connecting to openvpn"
sudo openvpn /home/nafea/Downloads/mustafanafea172.ovpn >/dev/null &
sleep 10

#check the connection of the openvpn
ifconfig | grep 10.8.242.122 
if [[ $? -eq 0 ]]; then
	echo "openvpn Connected...." 
else
	echo "failed to connect the openvpn...."
	exit
fi

#check the connection with ping
ping -c 4 10.10.10.10
if [ $? -eq 0 ]; then
    echo "Ping successful...."
else
    echo "Ping failed...."
    exit 
fi

#Disconnecting the warp
warp-cli disconnect