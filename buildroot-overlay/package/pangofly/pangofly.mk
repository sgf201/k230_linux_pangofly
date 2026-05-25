################################################################################
#
# pangofly
#
################################################################################
PANGOFLY_SITE = "$(realpath $(TOPDIR))/../pangofly"
PANGOFLY_SITE_METHOD = local
PANGOFLY_INSTALL_TARGET = YES
PANGOFLY_SUPPORTS_IN_SOURCE_BUILD = NO

define PANGOFLY_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(PANGOFLY_SITE)/pangofly/cmake -j$(PARALLEL_JOBS)
endef

define PANGOFLY_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib
	cp -f $(PANGOFLY_SITE)/pangofly/cmake/libpangofly.so $(TARGET_DIR)/usr/lib/
	cp -rf $(PANGOFLY_SITE)/pangofly/include $(TARGET_DIR)/usr/
	cp -rf $(PANGOFLY_SITE)/pangofly/examples $(TARGET_DIR)/root/app/pangofly
endef

$(eval $(cmake-package))
