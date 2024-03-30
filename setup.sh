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
      #sudo apt-get install -y ntfs-*
      sudo apt-get install -y libdrm-dev libegl1-mesa-dev libgles2-mesa-dev libgbm-dev      
      
      clear
      echo "Compiling Pistrorm"
      echo " "
cd      
git clone https://github.com/captain-amygdala/pistorm.git
cd pistorm
make PLATFORM=PI3_BULLSEYE

sudo chmod -R 777 /home/$USER/pistorm
sudo cp -R /home/$USER/Pithunder/scripts/* /usr/local/bin	 

cp  /home/$USER/Pithunder/scripts/bashrc /home/$USER/.bashrc


 sudo cp -R /home/$USER/Pithunder/config/pistorm.service /etc/systemd/system/pistorm.service
 sudo systemctl enable pistorm
 
 sudo cp -R /home/$USER/Pithunder/config/splash.service /etc/systemd/system/splash.service
 sudo cp -R /home/$USER/Pithunder/config/Booting.png /etc/systemd/system/Booting.png
 sudo systemctl enable splash

      # Dissable Services
     
        sudo systemctl disable apt-daily-upgrade.service 
	sudo systemctl disable apt-daily-upgrade.timer
	sudo systemctl disable apt-daily.service
	sudo systemctl disable apt-daily.timer
	sudo systemctl disable cups
     	sudo systemctl disable rsyslog.service.
	sudo systemctl disable syslog.socket
	sudo systemctl disable service webmin
        sudo systemctl disable glamor-test.service
	sudo systemctl disable man-db.service 
	sudo systemctl disable man-db.timer
	sudo systemctl disable plymouth-reboot.service 
	sudo systemctl disable plymouth-start.service 
	sudo systemctl disable alsa-restore.service at boot time
	sudo systemctl disable alsa-state.service at boot time    
        sudo update-rc.d motd remove
	sudo rm -rf /etc/systemd/pstore.conf
       	sudo rm -rf /etc/systemd/journald.conf
       	sudo rm -rf /etc/systemd/system/network-online.target.wants/
       	sudo rm -rf /etc/systemd/system/syslog.service
       	sudo rm -rf /etc/systemd/system/lo*
       	sudo rm -rf /etc/systemd/system/cu*
       	sudo rm -rf /etc/systemd/system/plymouth-start.service
       	sudo rm -rf /etc/systemd/system/multi-user.target.wants/cu*
       	sudo rm -rf /etc/systemd/system/multi-user.target.wants/rsyslog.service
       	sudo rm -rf /etc/systemd/system/printer.target.wants/

sudo cp -R /home/$USER/Pithunder/config/default.cfg /home/$USER/pistorm/
sudo cp  /home/$USER/Pithunder/scripts/.bashrc /home/$USER/.bashrc

sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_expand_rootfs
sudo reboot now
