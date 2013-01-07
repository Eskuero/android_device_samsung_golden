LOCAL_PATH_OPENSOURCE := $(call my-dir)

ifeq ($(TARGET_BUILD_OPENSOURCE_LIBS),true)
include $(call first-makefiles-under,$(LOCAL_PATH_OPENSOURCE))
endif
