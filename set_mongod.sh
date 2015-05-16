#update
apt-get update
apt-get upgrade

#download compiled mongod
wget http://www.widriksson.com/wp-content/uploads/2014/02/mongodb-rpi_20140207.zip

#run root
adduser --firstuid 100 --ingroup nogroup --shell /etc/false --disabled-password --gecos "" --no-create-home mongodb
cp -R mongodb-rpi/mongo /opt
chmod +x /opt/mongo/bin/*
mkdir /var/log/mongodb 
chown mongodb:nogroup /var/log/mongodb
mkdir /var/lib/mongodb
chown mongodb:nogroup /var/lib/mongodb
cp mongodb-rpi/debian/init.d /etc/init.d/mongod
cp mongodb-rpi/debian/mongodb.conf /etc/
ln -s /opt/mongo/bin/mongod /usr/bin/mongod
chmod u+x /etc/init.d/mongod
update-rc.d mongod defaults
/etc/init.d/mongod start
