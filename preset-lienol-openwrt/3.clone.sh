#!/usr/bin/env bash

# download base code
CODE_DIR=_firmware_code
CODE_URL=https://github.com/Lienol/openwrt
CODE_BRANCH=23.05
git clone --depth 1 -b $CODE_BRANCH $CODE_URL $CODE_DIR
mv ./$CODE_DIR/* ./

# download app codes
SUPPLY_DIR=_supply_packages
echo "src-link supply $PWD/$SUPPLY_DIR" >> feeds.conf.default
mkdir $SUPPLY_DIR && cd $SUPPLY_DIR
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git
git clone --depth 1 https://github.com/Ausaci/luci-app-nat6-helper.git
git clone --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git
# [Deprecated+Useless] git clone --depth 1 https://github.com/maxlicheng/luci-app-unblockmusic.git
# && mv luci-app-unblockmusic/app/ ./luci-app-unblockmusic && mv luci-app-unblockmusic/UnblockNeteaseMusic ./ && mv luci-app-unblockmusic/UnblockNeteaseMusicGo ./ && rm -rf luci-app-unblockmusic
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git pw-dependencies

# change v2ray-plugin
# aria2c https://github.com/honwen/openwrt-v2ray-plugin/raw/master/Makefile -o ./pw-dependencies/v2ray-plugin/Makefile

git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git && mv openwrt-passwall/luci-app-passwall ./ && rm -rf openwrt-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git && mv openwrt-passwall2/luci-app-passwall2 ./ && rm -rf openwrt-passwall2
git clone --depth 1 https://github.com/vernesong/OpenClash.git && mv OpenClash/luci-app-openclash ./ && rm -rf OpenClash

# download more codes
git clone --depth 1 https://github.com/pexcn/openwrt-chinadns-ng.git
git clone --depth 1 https://github.com/izilzty/luci-app-chinadns-ng.git
# [SAME with the above]git clone --depth 1 https://github.com/sbwml/openwrt_helloworld.git temp && mv ./temp/chinadns-ng ./ && rm -rf temp
# git clone --depth 1 https://github.com/immortalwrt/luci.git temp && mv ./temp/applications/luci-app-appfilter ./ && rm -rf temp
# git clone --depth 1 https://github.com/destan19/OpenAppFilter.git
git clone --depth 1 https://github.com/Lienol/openwrt-OpenAppFilter.git
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go.git
