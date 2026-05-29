#
# Copyright (C) 2022 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/tecno/LJ9

#PRODUCT_ENABLE_UFFD_GC := true
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# API
PRODUCT_SHIPPING_API_LEVEL := 34
BOARD_SHIPPING_API_LEVEL := 34
PRODUCT_TARGET_VNDK_VERSION := 34

ENABLE_VIRTUAL_AB := true
PRODUCT_VIRTUAL_AB_OTA := true

PRODUCT_VENDOR_PROPERTIES += ro.virtual_ab.enabled=true

# A/B
AB_OTA_UPDATER := true
ENABLE_VIRTUAL_AB := true
#TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true
AB_OTA_PARTITIONS += \
    boot \
    init_boot \
    vendor_boot \
    dtbo \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    odm \
    product \
    system \
    system_ext \
    system_dlkm \
    vendor \
    vendor_dlkm
    

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true
       
# Update engine
PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    checkpoint_gc \
    update_engine \
    update_verifier \
    update_engine_sideload
       
# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES_DEBUG += \
    bootctrl
    
# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd
    
# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Mtk plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery
    
# Otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/releasekey

# Hidl Service
# PRODUCT_ENFORCE_VINTF_MANIFEST := true

# TWRP_REQUIRED_MODULES += \
    task_profiles.json
    
# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libgatekeeper \
    libgatekeeper_aidl \
    libkeymaster41 \
    libpuresoftkeymasterdevice

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper_aidl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# Take a few libraries from sources
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.allocator@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.memory.token@1.0 \
    libdmabufheap \
    libhidlmemory \
    libion

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

#PRODUCT_PACKAGES += linker.vendor_ramdisk shell_vendor_ramdisk
#PRODUCT_PACKAGES += linker.recovery shell_and_utilities_recovery
