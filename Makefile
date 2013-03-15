include $(THEOS)/makefiles/common.mk

TOOL_NAME = DuoGamerTest
DuoGamerTest_FILES = DuoGamerSDK.m main.xm
DuoGamerTest_FRAMEWORKS = CoreFoundation ExternalAccessory
DuoGamerTest_LDFLAGS = -lsubstrate

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/tool.mk
