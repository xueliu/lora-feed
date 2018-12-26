# lora-feed
Semtech packages for OpenWRT/LEDE.
This repository is originated from [this](https://github.com/JiapengLi/OpenWrt-lora)

![luci](luci-lora-gateway.png)

## Table of Contents

- [Install](#install)
- [Issues](#issues)
- [Contribute](#contribute)
- [License](#license)

## Install

Edit your feeds.conf or feed.conf.default and add the following to it:

    # Semtech
    src-git lora https://github.com/xueliu/lora-feed

Update your build environment and install the package:

    $ scripts/feeds update lora
    $ scripts/feeds install -p lora
    $ make menuconfig

Go to Libraries, select libloragw, input the SPI device path you will use in your dev board;  
Go to Network --> LoRaWAN, select packet-forwarder and other programs you want;  
Go to LuCI --> Applications, select luci-app-pkt-fwd;  

Exit, save and build

    $ make -j4

Following two packages are only working on Raspberry Pi
 
    $ make package/wiringpi/install
    $ make package/single_chan_pkt_fwd/install

## Issues
- [x] Reset pin is configurable;
- [ ] Add predefined parameters for different countries;
- [ ] Generate global_conf.json with lbt section;

## Contribute

Found a bug? Please create an issue on GitHub:
    https://github.com/xueliu/lora-feed/issues

Further tests and PR's are welcome and appreciated.

## License

GPLv2
