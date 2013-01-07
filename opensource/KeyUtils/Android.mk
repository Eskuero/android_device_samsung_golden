ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	src/keyutils.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include


LOCAL_CFLAGS += -O2 -fomit-frame-pointer -DOPENSSL_NO_ASM -DDEBUG_DE_ANDROID

LOCAL_MODULE:= libkeyutils

LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := libc

LOCAL_SYSTEM_SHARED_LIBRARIES :=
LOCAL_PRELINK_MODULE := false
LOCAL_CFLAGS += -DECRYPTFS_ENABLED

include $(BUILD_SHARED_LIBRARY)

endif
