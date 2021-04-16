
if [ ! -d /opt/bin ]; then
    mkdir /opt/bin
fi 

if [ ! -f /opt/bin/cht.sh ]; then
    curl https://cht.sh/:cht.sh > /opt/bin/cht.sh
    chmod +x /opt/bin/cht.sh
fi