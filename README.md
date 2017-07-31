# lora-feed
Semtech packages for OpenWRT/LEDE.
This repository is originated from [this](https://github.com/JiapengLi/OpenWrt-lora)

## Table of Contents

- [Patch](#patch)
- [Install](#install)
- [Issues](#issues)
- [Contribute](#contribute)
- [License](#license)

## Patch
packet-forwarder requires function qsort_r which is not avaiable in neither musl library 1.1.15 nor 1.1.16.
Therefore we should [patch](https://github.com/xueliu/lora-feed/blob/master/101-added_qsort_r.patch) the toolchain at first.

    $ cp 101-added_qsort_r.patch $SOURCE_TREE/toolchain/musl/patches
    $ make toolchain/clean
    $ make toolchain/compile
    $ make toolchain/install
Note: Please make sure that the musl library is updated in the file system. You could reinstall libc_1.1.15-1_pistachio.ipk to update your existing system.

## Install

Edit your feeds.conf or feed.conf.default and add the following to it:

    # Semtech
    src-git lora https://github.com/xueliu/lora-feed

Update your build environment and install the package:

    $ scripts/feeds update lora
    $ scripts/feeds install -p lora
    $ make menuconfig

Go to Libraries Network, select libloragw, input the SPI device path you will use in your dev board;  
Go to Nework-->LoRaWAN, select packet-forwarder and other programs you want;  
Go to LuCI-->Applications, select luci-app-pkt-fwd;  

Exit, save and build

    $ make -j4

Following two packages are only working on Raspberry Pi
 
    $ make package/wiringpi/install
    $ make package/single_chan_pkt_fwd/install

## Issues
- [x] Reset pin is hardcoded;
- [ ] No predefined parameters for different countries;
- [ ] Can not generate global_conf.json with lbt section;

## Contribute

Found a bug? Please create an issue on GitHub:
    https://github.com/xueliu/lora-feed/issues

Further tests and PR's are welcome and appreciated.

## License

GPLv2
