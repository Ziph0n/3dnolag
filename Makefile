export THEOS_DEVICE_IP=192.168.1.20

ARCHS = armv7 arm64
GO_EASY_ON_ME = 1
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = 3DNoLag
3DNoLag_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += 3dnolag
include $(THEOS_MAKE_PATH)/aggregate.mk
