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

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_BOARD_SUFFIX := _64

# OTA assert
TARGET_OTA_ASSERT_DEVICE := TECNO-LJ9,LJ9,lj9

# Platform
TARGET_BOARD_PLATFORM := mt6897
PRODUCT_PLATFORM        := mt6897
TARGET_USES_UEFI        := true

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := LJ9
TARGET_NO_BOOTLOADER := true

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_PLUGIN_VALIDATION := soong-libguitwrp_defaults soong-libaosprecovery_defaults soong-libminuitwrp_defaults soong-vold_defaults

# Kernel
BOARD_RAMDISK_USE_LZ4 := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_BASE := 0x3fff8000
BOARD_PAGE_SIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_TAGS_OFFSET := 0x07c88000
BOARD_BOOT_HEADER_VERSION := 4
BOARD_HEADER_SIZE := 2128
BOARD_DTB_SIZE := 401471
BOARD_DTB_OFFSET := 0x07c88000

TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_KERNEL_IMAGE_NAME := kernel

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := tecno_dynamic_partitions
BOARD_TECNO_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system_dlkm \
    vendor \
    vendor_dlkm \
    system \
    odm_dlkm \
    product \
    system_ext
    
BOARD_TECNO_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_MAIN_PARTITION_LIST))
# $(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := erofs))
# $(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))

# File systems
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE     := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE     := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE    := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE   := f2fs

BOARD_USES_VENDOR_DLKMIMAGE := true

TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_PRODUCT    := product
TARGET_COPY_OUT_VENDOR     := vendor

# Metadata
TW_PREPARE_DATA_MEDIA_EARLY := true
BOARD_ROOT_EXTRA_FOLDERS      += metadata tranfs

# Disable system mount
TW_NO_BIND_SYSTEM := true

# Recovery
TW_SKIP_ADDITIONAL_FSTAB := true
TARGET_NO_RECOVERY := true
#BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true

# AVB
BOARD_AVB_ENABLE := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_LJ9
TARGET_RECOVERY_DEVICE_MODULES := libinit_LJ9

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_SYSTEM_PROP     += $(DEVICE_PATH)/system.prop
TARGET_RECOVERY_FSTAB  := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/init.recovery.mt6897.rc

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD    := true
#TWRP_EVENT_LOGGING := true

# Fastbootd
TW_INCLUDE_FASTBOOTD := true

# Crypto
TW_INCLUDE_CRYPTO := false  #true
TW_INCLUDE_CRYPTO_FBE := false #true
TW_INCLUDE_FBE_METADATA_DECRYPT := false #true
BOARD_USES_METADATA_PARTITION := true
TW_USE_FSCRYPT_POLICY := 2

PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Tools / Resetprop and magiskboot / TWRP-Specific configuration
TW_INCLUDE_RESETPROP    := false #true
TW_INCLUDE_LIBRESETPROP := false #true
TW_INCLUDE_REPACKTOOLS  := false #true
TW_INCLUDE_FUSE_EXFAT := true
TW_NO_FASTBOOT_BOOT := true
TW_NO_SCREEN_BLANK  := true
TARGET_USES_MKE2FS  := true
TW_INCLUDE_NTFS_3G  := true
TW_USE_TOOLBOX      := true

TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_APEX    := true
TW_EXCLUDE_PYTHON  := true
TW_EXCLUDE_NANO    := false
TW_EXCLUDE_LPTOOLS := false
TW_EXCLUDE_LPDUMP  := false
TW_EXCLUDE_BASH    := false
TW_EXCLUDE_TZDATA  := false
TW_INCLUDE_REPACK_TOOL := true

TW_BACKUP_EXCLUSIONS    := /Files/backup
TW_EXTRA_LANGUAGES      := true
TW_DEFAULT_LANGUAGE     := ru
TW_SCREEN_BLANK_ON_BOOT := true

#TW_ENABLE_ALL_PARTITION_TOOLS := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true
#TW_INCLUDE_FB2PNG := true

#TW_INCLUDE_FUSE_NTFS  := true
#TW_NO_SCREEN_TIMEOUT := true
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
#TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_LOAD_VENDOR_BOOT_MODULES := true

# Density / StatusBar
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness

TW_INPUT_BLACKLIST    := "hbtp_vm"
TW_THEME              := portrait_hdpi

TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CLOCK_POS := 730

TW_MAX_BRIGHTNESS := 295
TW_DEFAULT_BRIGHTNESS := 180

TARGET_SCREEN_WIDTH   := 1260
TARGET_SCREEN_HEIGHT  := 2800
TARGET_SCREEN_DENSITY := 520

# TW_CUSTOM_CPU_POS := 50
# TW_CUSTOM_BATTERY_POS := 800

# CPU Temperature
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone28/temp"

# USB Mounting
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file

# Fix stock .ozip installation
# TW_SKIP_COMPATIBILITY_CHECK := true
# TW_OZIP_DECRYPT_KEY := 0000

# Selinux
# TWHAVE_SELINUX := true
# SEPOLICY_IGNORE_NEVERALLOWS := true
# SELINUX_IGNORE_NEVERALLOWS  := true

# Storage
RECOVERY_SDCARD_ON_DATA     := true
#BOARD_HAS_NO_REAL_SDCARD   := true 
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Charger Mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# MTP
TW_EXCLUDE_MTP := false
TW_HAS_MTP := true

# Building a vendor boot from a generated ramdisk
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true

# BOARD_USES_RECOVERY_AS_BOOT := 
# BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := 
# BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := 

# Assembling a vendor boot with the addition of a ready-made ramdisk
# BOARD_VENDOR_RAMDISK_FRAGMENTS := recovery
# BOARD_VENDOR_RAMDISK_FRAGMENT.recovery.PREBUILT := $(DEVICE_PATH)/prebuilt/recovery/ramdisk.2.lz4
# BOARD_VENDOR_RAMDISK_FRAGMENT.recovery.MKBOOTIMG_ARGS := --ramdisk_type RECOVERY

# Device 
TW_DEVICE_VERSION=Tecno Pova 7 Ultra - isus203
