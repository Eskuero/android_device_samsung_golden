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
