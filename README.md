<h2 align="left">Instructions</h2>

###

use o comando para arrumar os problemas do termux no Android 14

pkg install termux-am

logo após isso 

termux-setup-storage

depois para usar permissão root use

su
 
depois

exit

use

pkg install git

depois 

git clone https://github.com/RaphaelStinson/change-kernel-between-permissive-and-enforcing

depois

se estiver em outro diretório sem ser a home faça

mv selinux_menu.sh/data/data/com.termux/files/home/

cd /data/data/com.termux/files/home/

se não estiver

add the file to the home page, then run the following commands 

chmod +x selinux_menu.sh

su -c ./selinux_menu.sh

testado em kernel extreme 
