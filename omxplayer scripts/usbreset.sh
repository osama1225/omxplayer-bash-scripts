([ -f /media/usb/reset ] && (

sudo bash -c "cat .scripts/interfaces.txt > /etc/network/interfaces"
sudo bash -c "cat .scripts/hosts.txt > /etc/hosts"
sudo bash -c "cat .scripts/hostname.txt > /etc/hostname"

sudo update-rc.d hostapd enable
sudo update-rc.d isc-dhcp-server enable

sudo shutdown -h now

)) &> /dev/null
