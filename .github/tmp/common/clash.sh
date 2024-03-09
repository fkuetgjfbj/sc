
#!/bin/bash
OP=$1

mkdir -p files/etc/openclash/core
CLASH_DEV_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-${OP}.tar.gz"
CLASH_TUN_URL=$(curl -fsSL https://api.github.com/repos/vernesong/OpenClash/contents/master/premium\?ref\=core | grep download_url | grep amd64 | awk -F '"' '{print $4}' | grep "v3" )
CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-${OP}.tar.gz"
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
wget -qO- $CLASH_DEV_URL | tar xOvz > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

[ -f files/etc/openclash/core/clash ] || mv -f ./package/patch/openclash/core/clash files/etc/openclash/core/clash
[ -f files/etc/openclash/core/clash_tun ] || mv -f ./package/patch/openclash/core/clash_tun files/etc/openclash/core/clash_tun
[ -f files/etc/openclash/core/clash_meta ] || mv -f ./package/patch/openclash/core/clash_meta files/etc/openclash/core/clash_meta
[ -f files/etc/openclash/GeoIP.dat ] || mv -f ./package/patch/openclash/GeoIP.dat files/etc/openclash/GeoIP.dat
[ -f files/etc/openclash/GeoSite.dat ] || mv -f ./package/patch/openclash/GeoSite.dat files/etc/openclash/GeoSite.dat

chmod +x files/etc/openclash/core/clash*

