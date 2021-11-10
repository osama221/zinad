#!/bin/bash

####################
# welcome message  #
####################



echo "hello $USER this is the magic works please enter the company name"

read name

echo "thank u we will now create the following files for $name"


########################
# setting up the files #
########################

mv  /etc/nginx/sites-available/default /home/$USER

rm /etc/nginx/sites-enabled/default

#################################################################################
#this line to copy the configurations we use always for every site nginx we only#
#have to modify the server name inside and ports numbers as we want.            #
################################################################################
cp ~/mainrepo/nginxtemplate.zisoft /etc/nginx/sites-available/$name.zisoftonline.com ## we need to modify this one here

ln -s /etc/nginx/sites-available/$name.zisoftonline.com /etc/nginx/sites-enabled

mkdir /deployment/$name


#!/bin/bash
sudo apt-get update

sudo apt upgrade -y

#sudo apt install php php-common php-cli php-gd php-curl php-mysql php-xml php-mbstring -y

#sudo apt remove "php*" --purge -y

#sudo apt remove "apache2" --purge -y

#sudo apt autoremove -y

docker stack rm $name

cd /deployment/$name/

bin/bash
sudo apt-get update

sudo apt upgrade -y

#sudo apt install php php-common php-cli php-gd php-curl php-mysql php-xml php-mbstring -y

#sudo apt remove "php*" --purge -y

#sudo apt remove "apache2" --purge -y

#sudo apt autoremove -y

docker stack rm $name

cd /deployment/$name/

rm -rf awareness

git clone https://awar:DkPiq8rY9Ffxihf-s8fF@gitlab.com/zisoft/awareness.git

sleep 10s

cd /deployment/$name/awareness

rm -rf /deployment/$name/awareness/.env

rm -rf /deployment/$name/awareness/storage/database

cp -vr ~/mainrepo/database/ /deployment/$name/awareness/storage/

cp -vr ~/mainrepo/basicconf.yml  /deployment/$name/awareness/

cp -vr ~/mainrepo/.env  /deployment/$name/awareness/

cp -vr /template/videos  /deployment/$name/awareness/public/

cd /deployment/$name/awareness

chmod -R 777 /deployment/$name/awareness/storage/framework/

chmod -R 777 /deployment/$name/awareness/storage/framework/

chmod -R 777 /deployment/$name/awareness/storage/logs/

chmod -R 777 /deployment/$name/awareness/public/videos

chmod -R 777 /deployment/$name/awareness/public/fonts

chmod -R 777 /deployment/$name/awareness/public/uploads

chmod -R 755 /deployment/$name/awareness/metabase

chmod -R 777 /deployment/$name/awareness/public/temp_reports

chmod -R 777 /deployment/$name/awareness/public/

cd /deployment/$name/awareness

zisoft build --docker  --ui --composer --prod

docker stack deploy -c 'basicconf.yml' $name

sleep 20s

docker service ls | grep $name
