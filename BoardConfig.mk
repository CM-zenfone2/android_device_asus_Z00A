#
# Copyright 2013 The Android Open-Source Project
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

# inherit from common mofd-common
-include device/asus/mofd-common/BoardConfigCommon.mk

TARGET_RELEASETOOLS_EXTENSIONS := device/asus/Z00A

# Partitions
BOARD_USERDATAIMAGE_PARTITION_SIZE := 59261286400

# Use the non-open-source parts, if they're present
-include vendor/asus/Z00A/BoardConfigVendor.mk

# TWRP
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_CRYPTO := true
# We don't currently have SuperSU binaries for x86, need to correct this at some point
TW_EXCLUDE_SUPERSU := true
TW_NO_USB_STORAGE := true
# Our parted binary is armv7 only so disable partitioning since it won't work anyway
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_NTFS_3G := true
# Fix slow wiping
BOARD_SUPPRESS_EMMC_WIPE := true
RECOVERY_VARIANT := twrp
