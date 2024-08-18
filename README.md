<h2 align="left">Instructions</h2>

###

use o comando para arrumar os problemas do termux no Android 14

pkg install termux-am

logo após isso 

termux-setup-storage

depois

mv selinux_menu.sh/data/data/com.termux/files/home/

cd /data/data/com.termux/files/home/

add the file to the home page, then run the following commands 

chmod +x selinux_menu.sh

su -c ./selinux_menu.sh
