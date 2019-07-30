# lora-feed
Semtech packages for OpenWRT/LEDE.
This repository is originated from [this](https://github.com/JiapengLi/OpenWrt-lora)

![luci](luci-lora-gateway.png)

## Table of Contents

- [Prerequisites](#prerequisites)
- [Install](#install)
- [Contribute](#contribute)
- [License](#license)
- [Donation](#donation)

## Prerequisites

In addition to packages required by [OpenWRT](https://openwrt.org/docs/guide-developer/build-system/install-buildsystem), 
extra packages should be installed if you want to install the LoRaServer:

    sudo apt install go-bindata
    sudo apt install nodejs

## Install

Edit your feeds.conf or feed.conf.default and add the following to it:

    # Semtech
    src-git lora https://github.com/xueliu/lora-feed

Update your build environment and install the packages:

    $ scripts/feeds update lora
    $ scripts/feeds install -a -p lora
    $ make menuconfig

Most programs are located in `Network -> LoRaWAN`

Exit, save and build

    $ make -j4

Following two packages are only working on Raspberry Pi
 
    $ make package/wiringpi/install
    $ make package/single_chan_pkt_fwd/install

## Contribute

Found a bug? Please create an issue on GitHub:
    https://github.com/xueliu/lora-feed/issues

Further tests and PR's are welcome and appreciated.

## Donation

In order to fully test of functions, donations of LoRa gateway board with GPS and Pico gateway are appreciated

## License

GPLv2
