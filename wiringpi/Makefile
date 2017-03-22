include $(TOPDIR)/rules.mk

PKG_NAME:=libwiringpi
PKG_VERSION:=2.44
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/WiringPi/WiringPi.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=c9476436016c995d3327e4765a73de7848d4af56
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libwiringpi
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libwiringpi
  DEPENDS:=@TARGET_brcm2708 +libpthread
  DEPENDS:= +libpthread
endef

define Package/libwiringpi/description
	WiringPi is a PIN based GPIO access library written in C 
	for the BCM2835 used in the Raspberry Pi
endef

define Package/libwiringpidev
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libwiringpidev
  DEPENDS:=+libpthread +libwiringpi
endef

define Package/libwiringpidev/description
	The devLib is a set of library routines implemented using wiringPi
	to give you easy access to some popular peripherals.
endef

define Package/gpio
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=CLI for wiringPi
  DEPENDS:=+libpthread +libwiringpi +libwiringpidev
endef

define Package/gpio/description
	gpio is a CLI utility which can be used to program and setup the GPIO pins.
	You can use this to read and write the pins and even use
	it to control them from shell scripts
endef

define Package/wiringpid
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=wiringPi Deamon
  DEPENDS:=+libpthread +libwiringpi +libwiringpidev
endef

define Package/wiringpid/description
	wiringPi Deamon
endef

TARGET_CFLAGS += \
	-Wall \
	-I. \
	-I$(PKG_BUILD_DIR)/wiringPi \
	-I$(PKG_BUILD_DIR)/devLib

TARGET_LDFLAGS += \
	-L$(PKG_BUILD_DIR)/wiringPi \
	-L$(PKG_BUILD_DIR)/devLib

define Build/Compile/libwiringpi
	$(MAKE) -C $(PKG_BUILD_DIR)/wiringPi \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
	$(CP) $(PKG_BUILD_DIR)/wiringPi/libwiringPi.so.$(PKG_VERSION) $(PKG_BUILD_DIR)/wiringPi/libwiringPi.so
endef

define Build/Compile/libwiringpidev
	$(MAKE) -C $(PKG_BUILD_DIR)/devLib \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
	$(CP) $(PKG_BUILD_DIR)/devLib/libwiringPiDev.so.$(PKG_VERSION) $(PKG_BUILD_DIR)/devLib/libwiringPiDev.so
endef

define Build/Compile/gpio
	$(MAKE) -C $(PKG_BUILD_DIR)/gpio \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Build/Compile/wiringpid
	$(MAKE) -C $(PKG_BUILD_DIR)/wiringPiD \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Build/Compile
	$(call Build/Compile/libwiringpi)
	$(call Build/Compile/libwiringpidev)
	$(call Build/Compile/gpio)
	$(call Build/Compile/wiringpid)
endef

define Package/libwiringpi/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/wiringPi/libwiringPi.so $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/wiringPi/*.h $(1)/usr/include/
endef

define Package/libwiringpidev/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/devLib/*.h $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/devLib/libwiringPiDev.so $(1)/usr/lib/
endef

define Package/gpio/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/gpio/gpio $(1)/usr/bin/
endef

define Package/wiringpid/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/wiringPiD/wiringpid $(1)/usr/bin/
endef

define Build/InstallDev 
	$(INSTALL_DIR) $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/devLib/libwiringPiDev.so $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/devLib/*.h $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/wiringPi/libwiringPi.so $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/wiringPi/*.h $(1)/usr/include/
endef

$(eval $(call BuildPackage,libwiringpi))
$(eval $(call BuildPackage,libwiringpidev))
$(eval $(call BuildPackage,gpio))
$(eval $(call BuildPackage,wiringpid))
