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

# Inherit CM common GSM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/golden/device_golden.mk)

# Device identifier
PRODUCT_DEVICE := golden
PRODUCT_NAME := cm_golden
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I8190
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint and ID
BUILD_ID := TRIANA00$(shell date -u +%Y%m%d)
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=cm_golden BUILD_FINGERPRINT=cyanogenmod/cm_golden/golden:4.1.2/$(BUILD_ID) PRIVATE_BUILD_DESC="GT-I8190 4.1.2"
