
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 97aa3ca8f9dca20e3f976a3e3d68fa31d268c559
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-polandru.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE=/home/paulperdomo/gcc-arm/bin//aarch64-none-linux-gnu- -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	$(INSTALL) -m 0755 $(@D)/finder-app/reqlibs/ld-linux-aarch64.so.1 ${TARGET_DIR}/lib/
	$(INSTALL) -m 0755 $(@D)/finder-app/reqlibs/libc.so.6 ${TARGET_DIR}/lib64/
	$(INSTALL) -m 0755 $(@D)/finder-app/reqlibs/libm.so.6 ${TARGET_DIR}/lib64/
	$(INSTALL) -m 0755 $(@D)/finder-app/reqlibs/libresolv.so.2 ${TARGET_DIR}/lib64/
	@echo hello
endef

$(eval $(generic-package))
