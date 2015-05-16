#install raspberry pi
#www.raspberrypi.org/downloads
#호환 SD카드 리스트들 : http://elinux.org/RPi_SD_cards

#check disk
diskutil list

#umount
diskutil unmountDisk /dev/disk2

#bin to img
hdiutil convert -format UDRW -o ~/path/target.img ~/path/isofile.iso

#dd image
cd download
sudo dd if=2013-07-26-wheezy-raspbian.img of=/dev/disk2 bs=2m

#keyboard settings
sudo vim /etc/default/keyboard
XKBLAYOUT="us"
sudo setupcon
reboot

#su password change
pi id/pass : pi / raspberry #최초 이계정으로 로그인 해야한다.

#change root password.
sudo passwd root
sudo passwd pi

#새로운 계정생성
sudo adduser username

#pkg setting
sudo apt-get update && sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get install ssh vim zip git git-core
sudo reboot
sudo apt-get install ttf-unfonts-core #set font

#IP고정으로 변경
ip route #아이피를 본다.
vi /etc/network/interface #수정한다.
iface eth0 inet static
address 192.168.0.19
netmask 255.255.255.0
broadcast 192.168.0.255
gateway 192.168.0.1 
dns-nameserver 168.126.63.1

#time zone 변경
sudo dpkg-reconfigure tzdata
asia -> seoul -> ok

#용량 익스펜드하기
sudo raspi-config

