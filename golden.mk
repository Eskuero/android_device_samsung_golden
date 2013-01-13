#
# Copyright (C) 2011 The CyanogenMod Project
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
DEVICE_PACKAGE_OVERLAYS += device/samsung/golden/overlay

# Inherit the proprietary vendors
$(call inherit-product-if-exists, vendor/samsung/golden/golden-vendor.mk)

# Use the Dalvik VM specific for devices with 1024 MB of RAM
ifeq ($(PLATFORM_VERSION),4.0.4)
# Workaround to fix lunch while building recovery from ICS source code.
$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
else
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
endif


# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Possibility of building opensource libs
$(call inherit-product, device/samsung/golden/opensource/Android.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/languages_full.mk)

# Copy hardware specific permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml 

# Copy media configuration
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/golden/prebuilt/system/etc/media_codecs.xml:system/etc/media_codecs.xml

# Copy egl configuration
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/lib/egl/egl.cfg:system/lib/egl/egl.cfg

# Copy vold configuration
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

# Copy ramdisk stuff
PRODUCT_COPY_FILES += \
    device/samsung/golden/prebuilt/root/init.bt.rc:root/init.bt.rc \
    device/samsung/golden/prebuilt/root/init.samsunggolden.rc:root/init.samsunggolden.rc \
    device/samsung/golden/prebuilt/root/init.samsunggolden.usb.rc:root/init.samsunggolden.usb.rc \
    device/samsung/golden/prebuilt/root/ueventd.samsunggolden.rc:root/ueventd.samsunggolden.rc \
    device/samsung/golden/prebuilt/root/init.trace.rc:root/init.trace.rc \
    device/samsung/golden/prebuilt/root/lpm.rc:root/lpm.rc \
    device/samsung/golden/prebuilt/root/prerecovery.rc:root/prerecovery.rc \
    device/samsung/golden/recovery/recovery.rc:root/recovery.rc \
    device/samsung/golden/prebuilt/root/lib/modules/bthid.ko:root/lib/modules/bthid.ko \
    device/samsung/golden/prebuilt/root/lib/modules/dhd.ko:root/lib/modules/dhd.ko \
    device/samsung/golden/prebuilt/root/lib/modules/hwreg.ko:root/lib/modules/hwreg.ko \
    device/samsung/golden/prebuilt/root/lib/modules/j4fs.ko:root/lib/modules/j4fs.ko \
    device/samsung/golden/prebuilt/root/lib/modules/param.ko:root/lib/modules/param.ko \
    device/samsung/golden/prebuilt/root/lib/modules/rng-core.ko:root/lib/modules/rng-core.ko \
    device/samsung/golden/prebuilt/root/lib/modules/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko \
    device/samsung/golden/prebuilt/root/lib/modules/vpnclient.ko:root/lib/modules/vpnclient.ko \

# Applications
PRODUCT_PACKAGES := \
    Torch

# Open source modules
PRODUCT_PACKAGES += \
		libexifa \
		libjpega \
		libkeyutils \
		libasound \
		bcm_dut \
		libnl

# Manager of partitions
PRODUCT_PACKAGES += \
		e2fsck

# Some build.prop defines
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.adb.qemud=1 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.sec.fle.encryption=true

# Define kind of DPI
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
