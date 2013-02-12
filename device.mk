#
# Copyright (C) 2013 The CyanogenMod Project
# by Cholokei - leesl0416@naver.com
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/dalikt/dalikt-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/dalikt/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/dalikt/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/samsung/dalikt/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/dalikt/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/samsung/dalikt/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/samsung/dalikt/ramdisk/init.target.rc:root/init.target.rc \
    device/samsung/dalikt/ramdisk/ueventd.rc:root/ueventd.rc \
    device/samsung/dalikt/ramdisk/init.emmc.rc:root/init.emmc.rc \
    device/samsung/dalikt/fstab.qcom:root/fstab.qcom

# Vold
PRODUCT_COPY_FILES += \
    device/samsung/dalikt/vold.fstab:system/etc/vold.fstab

# BT firmware
PRODUCT_COPY_FILES += \
    device/samsung/dalikt/firmware/bcm4330B1.hcd:system/etc/firmware/bcm4330B1.hcd

# keylayouts
PRODUCT_COPY_FILES += \
    device/samsung/dalikt/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# common msm8660
$(call inherit-product, device/samsung/msm8660-common/msm8660.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/samsung/dalikt/dalikt-vendor.mk)

#WIFI_BAND := 802_11_ABG
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
