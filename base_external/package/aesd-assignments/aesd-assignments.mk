
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 527dfb5f7c17ba0071a530db4929e3c3711cc967 
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-polandru.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS-COMPILE=aarch64-none-linux-gnu-	 -C $(@D)/finder-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer ${TARGET_DIR}/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh ${TARGET_DIR}/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh ${TARGET_DIR}/usr/bin/
	@mkdir -p ${TARGET_DIR}/root/conf 
	$(INSTALL) -m 0755 $(@D)/finder-app/conf/username.txt ${TARGET_DIR}/root/conf/username.txt
	$(INSTALL) -m 0755 $(@D)/finder-app/reqlibs/ld-linux-aarch64.so.1 ${TARGET_DIR}/lib/
	$(INSTALL) -m 0755 $(@D)/finder-app/reqlibs/libc.so.6 ${TARGET_DIR}/lib64/
	$(INSTALL) -m 0755 $(@D)/finder-app/reqlibs/libm.so.6 ${TARGET_DIR}/lib64/
	$(INSTALL) -m 0755 $(@D)/finder-app/reqlibs/libresolv.so.2 ${TARGET_DIR}/lib64/
	
endef

$(eval $(generic-package))
