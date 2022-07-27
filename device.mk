#
# Copyright (C) 2022 Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/realme/RMP6768

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# Vendor overlay
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/vendor_overlay/,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_EXTRA_VNDK_VERSIONS)/)

# Copy fstab
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor_overlay/etc/fstab.mt6768:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6768
    
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.RMP6768

# HIDL
PRODUCT_PACKAGES += \
    libhardware
    
# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Screen density
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
TARGET_SCREEN_DENSITY := 240

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# A/B
AB_OTA_UPDATER := false

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mt6768.rc

# Init
PRODUCT_PACKAGES += \
    init.mt6768.rc

# Tablet
PRODUCT_CHARACTERISTICS := tablet

# WiFi Overlays
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)