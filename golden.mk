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

DEVICE_PACKAGE_OVERLAYS += device/samsung/golden/overlay

# Inherit from those products. Most specific first.
$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/languages_full.mk)

# The GPS config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Use the Dalvik VM specific for devices with 1024 MB of RAM
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Inherit the proprietary vendors
$(call inherit-product-if-exists, vendor/samsung/golden/golden-vendor.mk)

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    libtinyalsa \
    libaudioutils

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Applications
PRODUCT_PACKAGES += \
    Torch \
    Superuser \
    com.android.future.usb.accessory

# Misc props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    net.bt.name=Android \
    ro.config.sync=yes

# Define kind of DPI
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Hardware specific permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

# Media configuration
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/golden/prebuilt/system/etc/media_codecs.xml:system/etc/media_codecs.xml

# Dbus
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/etc/dbus.conf:system/etc/dbus.conf

# EGL configuration
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/lib/egl/egl.cfg:system/lib/egl/egl.cfg

# Vold configuration
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

# Keylayout and touchscreen configs
PRODUCT_COPY_FILES += \
device/samsung/golden/prebuilt/system/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/samsung/golden/prebuilt/system/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/samsung/golden/prebuilt/system/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/samsung/golden/prebuilt/system/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/samsung/golden/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/golden-kp.kl:system/usr/keylayout/golden-kp.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/samsung/golden/prebuilt/system/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    device/samsung/golden/prebuilt/system/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/samsung/golden/prebuilt/system/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc
    
# Copy ramdisk stuff
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/root/init.rc:root/init.rc \
    device/samsung/golden/prebuilt/root/init.bt.rc:root/init.bt.rc \
    device/samsung/golden/prebuilt/root/init.samsunggolden.rc:root/init.samsunggolden.rc \
    device/samsung/golden/prebuilt/root/init.samsunggolden.usb.rc:root/init.samsunggolden.usb.rc \
    device/samsung/golden/prebuilt/root/ueventd.samsunggolden.rc:root/ueventd.samsunggolden.rc \
    device/samsung/golden/recovery/recovery.rc:root/recovery.rc \
    device/samsung/golden/prebuilt/root/prerecovery.rc:root/prerecovery.rc \
    device/samsung/golden/prebuilt/root/lpm.rc:root/lpm.rc \
    device/samsung/golden/prebuilt/root/fstab.samsunggolden:root/fstab.samsunggolden \
    device/samsung/golden/prebuilt/root/lib/modules/j4fs.ko:root/lib/modules/j4fs.ko \
    device/samsung/golden/prebuilt/root/lib/modules/param.ko:root/lib/modules/param.ko

# OMXLoader
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/omxloaders:system/omxloaders

# STE Modem and CSPSA
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/etc/cspsa.conf:system/etc/cspsa.conf \
    device/samsung/golden/prebuilt/system/etc/ste_modem.sh:system/etc/ste_modem.sh

# USB Init
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/bin/usbid_init.sh:system/bin/usbid_init.sh

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
PRODUCT_PACKAGES += \
    macloader

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/golden/prebuilt/system/etc/asound.conf:system/etc/asound.conf
