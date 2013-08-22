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

-include device/samsung/u8500-common/BoardCommonConfig.mk
TARGET_OTA_ASSERT_DEVICE := golden,i8190,GT-I8190

# Board
TARGET_BOOTLOADER_BOARD_NAME := DB8520H

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5064622080
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/golden
TARGET_KERNEL_CONFIG := cyanogenmod_golden_defconfig
TARGET_USE_ST_ERICSSON_KERNEL := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/golden/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/golden/bluetooth/btvendor_golden.txt

# Wifi
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin_b2"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin_b2"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/wifi/bcmdhd_p2p.bin_b2"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin_b2 nvram_path=/system/etc/wifi/nvram_net.txt_GPIO4"
WIFI_DRIVER_MODULE_AP_ARG := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin_b2 nvram_path=/system/etc/wifi/nvram_net.txt_GPIO4"

# Vold
BOARD_VOLD_MAX_PARTITIONS := 25
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true

# Recovery
TARGET_RECOVERY_INITRC := device/samsung/golden/recovery/recovery.rc
