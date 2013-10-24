# Inherit CM common GSM stuff.
$(call inherit-product, vendor/cos/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := GT-I9100

# Bootanimation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cos/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/golden/golden.mk)

# Device identifier
PRODUCT_DEVICE := golden
PRODUCT_NAME := cos_golden
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I8190
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint and ID
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=cm_golden BUILD_FINGERPRINT=cyanogenmod/cm_golden/golden:4.3.1/$(BUILD_ID) PRIVATE_BUILD_DESC="GT-I8190 4.3.1"
