#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
#wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/soffchen/GeoIP2-CN/release/CN-ip-cidr.txt

# 17mon-CN
wget --no-check-certificate -c -O 17mon-CN.txt https://github.com/17mon/china_ip_list/blob/master/china_ip_list.txt

{
echo "/ip firewall address-list"

for net in $(cat 17mon-CN.txt) ; do
  echo "add list=17mon-CN address=$net comment=17mon-CN"
done

} > ../17mon-CN.rsc

cd ..
rm -rf ./pbr
