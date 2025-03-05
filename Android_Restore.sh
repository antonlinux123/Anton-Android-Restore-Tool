#Files placed in apk folder will be installed to your android device
for apk in ./apk/*.apk; do adb install "$apk"; done
#Make sure you have created a backup.ab backup and place it in the backup folder
adb restore backup/backup.ab 
if [ $? -ne 0 ]; then
  echo "
  PLEASE CREATE BACKUP FIRST!!!"
fi 
#Copies the the files in the camera folder and places them in your android devices DCIM/Camera folder
adb push camera/* ./storage/emulated/0/DCIM/Camera
#Sets the animation speed to sane defaults
adb shell settings put global window_animation_scale 0.25
adb shell settings put global transition_animation_scale 0.25
adb shell settings put global animator_duration_scale 0.25
#Updates applications that are installed through Fdroid
./fdroidcl_v0.7.0_linux_amd64 update
./fdroidcl_v0.7.0_linux_amd64 search -u
./fdroidcl_v0.7.0_linux_amd64 install -u


