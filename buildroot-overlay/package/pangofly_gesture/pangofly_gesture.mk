################################################################################
#
# pangofly_gesture
#
################################################################################

PANGOFLY_GESTURE_SITE = $(realpath $(TOPDIR))/../pangofly/gesture
PANGOFLY_GESTURE_SITE_METHOD = local
PANGOFLY_GESTURE_INSTALL_TARGET = YES
PANGOFLY_GESTURE_SUPPORTS_IN_SOURCE_BUILD = NO
PANGOFLY_GESTURE_DEPENDENCIES = pangofly

define PANGOFLY_GESTURE_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(PANGOFLY_GESTURE_SITE) all
endef

define PANGOFLY_GESTURE_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/bin
    cp -f $(PANGOFLY_GESTURE_SITE)/gesture_publisher $(TARGET_DIR)/usr/bin/
    cp -f $(PANGOFLY_GESTURE_SITE)/gesture_subscriber $(TARGET_DIR)/usr/bin/
endef

$(eval $(cmake-package))
