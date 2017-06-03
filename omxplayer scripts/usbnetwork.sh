([ -f /media/usb/conn ] && (

name=JAAM;
pass=elmohandsme125;

sudo update-rc.d hostapd disable; 
sudo update-rc.d isc-dhcp-server disable;
                                
sudo bash -c 'cat .scripts/interfaces_wlan.txt > /etc/network/interfaces';
sudo bash -c 'cat .scripts/wpa_supplicant_head.txt > /etc/wpa_supplicant/wpa_supplicant.conf';
                                 
sudo bash -c 'echo network={ >> /etc/wpa_supplicant/wpa_supplicant.conf';
sudo bash -c 'echo -e ssid=\"JAAM\" >> /etc/wpa_supplicant/wpa_supplicant.conf';
sudo bash -c 'echo -e psk=\"elmohandsme125\" >> /etc/wpa_supplicant/wpa_supplicant.conf';
sudo bash -c 'echo key_mgmt=WPA-PSK >> /etc/wpa_supplicant/wpa_supplicant.conf';
sudo bash -c 'echo } >> /etc/wpa_supplicant/wpa_supplicant.conf';

sudo shutdown -h now

)) &> /dev/null
