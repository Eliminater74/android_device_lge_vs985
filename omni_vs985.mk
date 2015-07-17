#
# Copyright 2014 The CyanogenMod Project
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

# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
#
# Inherit from vs985 device
#
#$(call inherit-product, device/lge/vs985/full_vs985.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)



PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Copy needed files to make everything work for recovery
PRODUCT_COPY_FILES += \
#    device/lge/vs985/kernel:kernel \
    device/lge/vs985/img_info:img_info \
    device/lge/vs985/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	device/lge/vs985/sign:recovery/root/res/sign

PRODUCT_COPY_FILES += device/lge/vs985/fstab.g3:recovery/root/fstab.g3
PRODUCT_COPY_FILES += device/lge/vs985/twrp.fstab:recovery/root/etc/twrp.fstab


# Set those variables here to overwrite the inherited values.
PRODUCT_DEVICE := vs985
PRODUCT_NAME := omni_vs985
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-VS985
PRODUCT_MANUFACTURER := LGE


PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="g3" \
    PRODUCT_NAME="g3_vzw_us" \
    BUILD_FINGERPRINT="lge/g3_vzw/g3:5.0.1/LRX21Y/150271517d422:user/release-keys" \
    PRIVATE_BUILD_DESC="g3_vzw-user 5.0.1 LRX21Y 150271517d422 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon
