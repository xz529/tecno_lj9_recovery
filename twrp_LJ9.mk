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

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure launch_with_vendor_ramdisk.mk
#$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure twrp config common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# Configure compression
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Device specific configs
$(call inherit-product, device/tecno/LJ9/device.mk)

# Configure virtual_ab_ota.mk
#$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Device identifier. This must come after all inclusions
PRODUCT_RELEASE_NAME := LJ9
PRODUCT_DEVICE := LJ9
PRODUCT_NAME := twrp_LJ9
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := LJ9
PRODUCT_MANUFACTURER := Tecno Mobility Limited

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=TECNO-LJ9 \
    PRODUCT_NAME=LJ9-OP \
    PRIVATE_BUILD_DESC="vext_lj9_h972-user 14 UP1A.231005.007 985789 release-keys"

BUILD_FINGERPRINT := TECNO/LJ9-OP/TECNO-LJ9:14/UP1A.231005.007/260324V2099:user/release-keys