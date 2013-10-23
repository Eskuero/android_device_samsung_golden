#
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2013 Óliver García Albertos (oliverarafo@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_SPECIFIC_HEADER_PATH := device/samsung/golden/include
TARGET_OTA_ASSERT_DEVICE := golden,i8190,GT-I8190

# Board
TARGET_BOOTLOADER_BOARD_NAME := DB8520H
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform 
TARGET_BOARD_PLATFORM := montblanc
TARGET_SOC := u8500
COMMON_GLOBAL_CFLAGS += -DSTE_HARDWARE -DSTE_SAMSUNG_HARDWARE

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_NEON := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5064622080
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Kernel
TARGET_KERNEL_CONFIG := cyanogenmod_golden_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/golden
TARGET_USE_ST_ERICSSON_KERNEL := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/golden/configs/lib/egl/egl.cfg
BOARD_EGL_NEEDS_LEGACY_FB := true

# Screen
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
BOARD_NO_APSME_ATTR := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/golden/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/golden/bluetooth/btvendor_golden.txt

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/golden/ril/

# Browser
ENABLE_WEBGL := true

# Audio
BOARD_USES_ALSA_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB

# Vold
BOARD_VOLD_MAX_PARTITIONS := 25
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true

# Charging mode
BOARD_LPM_BOOT_ARGUMENT_NAME := lpm_boot
BOARD_LPM_BOOT_ARGUMENT_VALUE := 1

# Recovery
BOARD_UMS_LUNFILE := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun%d/file"
TARGET_RECOVERY_INITRC := device/samsung/golden/recovery/recovery.rc
TARGET_RECOVERY_FSTAB := device/samsung/golden/rootdir/fstab.samsunggolden
RECOVERY_FSTAB_VERSION := 2
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/golden/recovery/graphics.c
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_EMMC_WIPE := true
