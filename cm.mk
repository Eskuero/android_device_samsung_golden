#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#   
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Inherit CM common GSM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration.
$(call inherit-product, device/samsung/golden/golden.mk)

# Device identifier.
PRODUCT_DEVICE := golden
PRODUCT_NAME := cm_golden
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I8190
PRODUCT_MANUFACTURER := samsung

PRODUCT_VERSION_DEVICE_RELEASE := ALPHA4
PRODUCT_VERSION_DEVICE_SPECIFIC := -TRIANA-$(PRODUCT_VERSION_DEVICE_RELEASE)

CM_UNOFFICIAL := 1
CM_EXTRAVERSION := TRIANA-$(PRODUCT_VERSION_DEVICE_RELEASE)

BUILD_ID := TRIANA00$(shell date -u +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=cm_golden BUILD_FINGERPRINT=cyanogenmod/cm_golden/golden:4.1.2/$(BUILD_ID) PRIVATE_BUILD_DESC="GT-I8190 4.1.2"
