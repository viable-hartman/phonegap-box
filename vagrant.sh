#!/usr/bin/env bash

apt-get -y update

apt-get -y install unzip
apt-get -y install git
apt-get -y install vim
apt-get -y install ubuntu-desktop

apt-get -y install python-software-properties python g++ make
add-apt-repository ppa:chris-lea/node.js
apt-get -y update

apt-get -y install nodejs

apt-get -y install default-jre
apt-get -y install default-jdk
apt-get -y install ant

npm install -g phonegap@3.5

if [ ! -e /vagrant/adt-bundle-linux-x86-20140702.zip ]
then
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  echo "Downloading adt-bundle (android sdk)"
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  wget http://dl.google.com/android/adt/adt-bundle-linux-x86-20140702.zip -P /vagrant
fi

if [ ! -d "/home/vagrant/android" ]
then
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  echo "Copying adt-bundle to /home/vagrant/android"
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  mkdir /home/vagrant/android
  cp /vagrant/adt-bundle-linux-x86-20140702.zip /home/vagrant/android/

  echo ">>>>>>>>>>>>>>>>>>>"
  echo "Unziping adt-bundle"
  echo ">>>>>>>>>>>>>>>>>>>"

  cd /home/vagrant/android
  unzip adt-bundle-linux-x86-20140702.zip

  echo ">>>>>>>>>>>>>>>>>>>"
  echo "Map the android sdk"
  echo ">>>>>>>>>>>>>>>>>>>"

  echo "export PATH=$PATH:/home/vagrant/android/adt-bundle-linux-x86-20140702/sdk/platform-tools:/home/vagrant/android/adt-bundle-linux-x86-20140702/sdk/tools" >> /home/vagrant/.bash_profile
  echo "export ANDROID_HOME=/home/vagrant/android/adt-bundle-linux-x86-20140702/sdk/" >> /home/vagrant/.bash_profile

  source /home/vagrant/.bash_profile

  chmod 777 -R /home/vagrant/android/
fi
