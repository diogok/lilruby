#!/usr/bin/env bash

# basic installation
apt-get update
apt-get install ruby openjdk-7-jdk curl git couchdb -y

# gem repositories
gem sources -r http://rubygems.org/
gem sources -r http://rubygems.org
gem sources -a https://rubygems.org

# RVM and jruby
curl -L https://get.rvm.io | bash -s stable
echo "source /usr/local/rvm/scripts/rvm" >> ~/.bashrc
source /usr/local/rvm/scripts/rvm
rvm get stable
rvm install $(cat /vagrant/.ruby-version) --verify-downloads 1 --max-time 200 --binary

# project setup
cd /vagrant
gem install bundler
bundle install
[[ ! -e config.yml ]] && cp config.yml.dist config.yml

# couchdb setup
service couchdb stop
cp /etc/couchdb/local.ini /etc/couchdb/local.ini.bkp
sudo sed -e 's/;bind_address = [0-9]\+.[0-9]\+.[0-9]\+.[0-9]\+/bind_address = 0.0.0.0/' /etc/couchdb/local.ini.bkp > /etc/couchdb/local.ini 
service couchdb start

# setting couchdb to always start
cp /etc/rc.local /etc/rc.local.bkp
sudo sed -e 's/exit/#exit/g' /etc/rc.local.bkp > /etc/rc.local
echo "service couchdb start" >> /etc/rc.local

# create databases
curl -x POST http://localhost:5984/lilruby
curl -x POST http://localhost:5984/lilruby_test

