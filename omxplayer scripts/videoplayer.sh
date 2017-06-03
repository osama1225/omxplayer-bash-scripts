
#! /bin/sh
(

rm /tmp/omxpipe
mkfifo /tmp/omxpipe

rm /tmp/filelog
touch /tmp/filelog

rm /tmp/pauselog
touch /tmp/pauselog

rm /tmp/indexlog
touch /tmp/indexlog
echo 0 > /tmp/indexlog

rm /tmp/recentfiles
touch /tmp/recentfiles

rm /tmp/playlist
touch /tmp/playlist

echo "p" > /tmp/pauselog

java -jar /home/pi/.scripts/FR_Service.jar &

while true; do
vid_index=0
echo 0 > /tmp/indexlog
#we will loop again, remove content of recentfiles
> /tmp/recentfiles
IFS=$'\n'
files=($(find /home /media -not -path '*/\.*' -size +0 -type f -name "*.mp4" -o -name "*.mov" -o -name "*.avi" -o -name "*.rmvb" -o -name "*.mkv" -o -name "*.m4v"))
count=${#files[@]}
#write files into playlist file
printf "%s\n" "${files[@]}" > /tmp/playlist
#looping
while [ $vid_index -lt $count ]
do
	#check if file exists
	if [ -f ${files[$vid_index]} ]; then
	    echo "" > /tmp/omxpipe &
	    echo "${files[$vid_index]}" > /tmp/filelog &
	    #check if subtitle exist, load it automatically
	        omxplayer --align center -b -o hdmi -r --no-osd ${files[$vid_index]} < /tmp/omxpipe
	fi	
	vid_index=$(</tmp/indexlog)	
	((vid_index++))
	echo $vid_index > /tmp/indexlog

	#check for recently added videos
	############
	IFS=$'\n' read -d '' -r -a recent < /tmp/recentfiles
	count_recent=${#recent[@]} 
	> /tmp/recentfiles 
	last_index=$count
	#union of two arrays
	tmp_index=0
	while [ $tmp_index -lt $count_recent ]
	do
		files[$last_index]=~/Videos/"${recent[$tmp_index]}"
		#add it to the playlist file
		printf "%s\n" "${files[$last_index]}" >> /tmp/playlist
		((last_index++))
		((tmp_index++))
		((count++))
	done
	##############

	
done
done

) &>/dev/null
