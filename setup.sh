#!/bin/bash
# Assign >NIL:  Install Pithunder
# Assign >NIL:  B.Titze 2024


#******************************************** #startup-sequence  :-) ************* ********************************************





sudo cp -R /boot/config.txt /boot/config_backup.txt

clear
echo "Welcome to Pithunder"
echo " "
echo " "
   
      sudo apt-get -y upgrade
	    sudo apt-get -y autoremove
      sudo apt-get install -y toilet dialog mc zip unzip wget
      sudo apt-get install -y libasound2-dev      
      sudo apt-get install -y ntfs-*
      sudo apt-get install -y libdrm-dev libegl1-mesa-dev libgles2-mesa-dev libgbm-dev      
      
      clear
      echo "Compiling Pistrorm"
      echo " "
cd      
git clone https://github.com/captain-amygdala/pistorm.git
cd pistorm
make PLATFORM=PI3_BULLSEYE

sudo chmod -R 777 /home/$USER/Amiga 
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin	 

cp  /home/$USER/Pithunder/scripts/bashrc /home/$USER/.bashrc

 sudo systemctl enable pistorm
 


sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_expand_rootfs
sudo reboot now
