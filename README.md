# omxplayer-bash-scripts
Custom Scripts that control omxplayer for customized raspberry pi

#### About the bash scripts:
- The main script (videoplayer.sh) make a playlist of all videos found either in the pi files or in the attached usbs and start playing them using omxplayer.
- Helper scripts are used to determine the player behavior based on the actions taken from the [remote app](https://github.com/osama1225/omxplayer-remote-app).


#### About the Customized Raspberry Pi image:
A jessie lite image is installed on raspberry pi 3 then the following customizations are added:
- Install openjdk 7
- Hiding the console log that appears on startup.
- Auto login
- Wifi configuration to make the pi acts as access point (make the pi create its own network)
- Auto start of bash scripts on boot that resposnible for opening the video player.
- Auto mount for attached usbs
