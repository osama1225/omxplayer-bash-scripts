#reset current settings
update-rc.d hostapd disable;
update-rc.d isc-dhcp-server disable;
cat .scripts/interfaces_wlan.txt > /etc/network/interfaces
cat .scripts/wpa_supplicant_head.txt > /etc/wpa_supplicant/wpa_supplicant.conf
#writing new network details
echo -e network={\\n ssid=\"$1\"\\n psk=\"$2\"\\n key_mgmt=WPA-PSK\\n} >> /etc/wpa_supplicant/wpa_supplicant.conf
#restart to apply changes
sudo reboot

