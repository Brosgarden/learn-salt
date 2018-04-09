#!/usr/bin/env bash
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list
apt-get update
apt-get install -y salt-minion
cp /home/vagrant/minion /etc/salt/minion && rm /home/vagrant/minion
systemctl restart salt-minion