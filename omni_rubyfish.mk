#
# Copyright 2012 The Android Open Source Project
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

# Release name

# Inherit from this configs
$(call inherit-product, build/target/product/embedded.mk)
$(call inherit-product, vendor/omni/config/common.mk)

# Device identifier. This must come after all inclusions.

#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/prebuilt/kernel:kernel \
#	$(LOCAL_PATH)/recovery.fstab:recovery.fstab

# Device identifier. This must come after all inclusions.

PRODUCT_DEVICE := rubyfish
PRODUCT_NAME := omni_rubyfish
PRODUCT_BRAND := Mobvoi
PRODUCT_MODEL := TicWatch Pro 3
PRODUCT_MANUFACTURER := mobvoi
PRODUCT_RELEASE_NAME := Mobvoi TicWatch Pro 3

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.device \
    ro.product.name \
    ro.build.product

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2025-12-31 \
	ro.secure=1 \
	ro.adb.secure=0
