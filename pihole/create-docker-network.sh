#!/bin/bash

# WARN: Read: https://blog.ivansmirnov.name/set-up-pihole-using-docker-macvlan-network/

# echo remove macvlan0
# sudo docker network rm macvlan0

# echo create macvlan0
 sudo docker network create -d macvlan --subnet=192.168.1.0/24 --gateway=192.168.1.1 --ip-range 192.168.1.80/28 -o parent=br0 --aux-address="myserver=192.168.1.95" macvlan0

# echo set promisc
 sudo ip link set br0 promisc on

# echo add macvlan shim
sudo ip link add macvlan-shim link br0 type macvlan mode bridge

# echo set macvlan shim ip
sudo ip addr add 192.168.1.95/28 dev macvlan-shim

# echo set macvlan shim up
sudo ip link set macvlan-shim up

# echo ifconfig
# ifconfig macvlan-shim
