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

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml


PRODUCT_AAPT_CONFIG := normal large xlarge hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# xhdpi, while we are hardcoding the 1080 resolution.
# when we start doing 720 as well, will need to stop hardcoding this.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

# There may be a cleaner way to do this.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=200m \
    dalvik.vm.heapsize=348m \
    dalvik.vm.heapminfree=512k

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

DEVICE_PACKAGE_OVERLAYS := \
    device/asus/moorefield/fhd/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    config_init.sh \
    fstab \
    fstab.mofd_v1 \
    fstab.zram \
    init.avc.rc \
    init.bt.rc \
    init.bt.vendor.rc \
    init.camera.rc \
    init.class_main.sh \
    init.common.rc \
    init.config_init.rc \
    init.debug.rc \
    init.diag.rc \
    init.firmware.rc \
    init.gps.rc \
    init.logtool.rc \
    init.modem.rc \
    init.mofd_v1.rc \
    init.nfc.rc \
    init.platform.usb.rc \
    init.readahead.rc \
    init.recovery.mofd_v1.rc \
    init.watchdog.rc \
    init.wifi.rc \
    init.wifi.vendor.rc \
    init.zram.rc \
    intel_prop.cfg \
    rfkill_bt.sh \
    ueventd.mofd_v1.rc

# Audio
PRODUCT_PACKAGES += \
    libtinyalsa \
    audio.a2dp.default \
    audio.primary.fhd \
    audio.r_submix.default \
    audio.usb.default

# Camera
PRODUCT_PACKAGES += \
    camera.fhd \
    libs3cjpeg

PRODUCT_PROPERTY_OVERRIDES += \
    ro.camera.number=1 \
    ro.camera.0.devname=/dev/video0 \
    ro.camera.0.facing=back \
    ro.camera.0.orientation=0

# specific management of audio_policy.conf
PRODUCT_COPY_FILES += \
    device/asus/moorefield/fhd/configs/audio_policy.conf:system/etc/audio_policy.conf

# Hdmi CEC: Fugu works as a playback device (4).
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4

# Add props used in stock
PRODUCT_PROPERTY_OVERRIDES +=  \
    ro.dalvik.vm.isa.arm=x86 \
    ro.enable.native.bridge.exec=1 \
    ro.vold.wipe_on_crypt_fail=1 \
    ro.nrdp.modelgroup=NEXUSPLAYERFUGU \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216 \
    media.stagefright.cache-params=10240/20480/15 \
    media.aac_51_output_enabled=true \
    dalvik.vm.implicit_checks=none

# Set the prop to enable arm native bridge
ADDITIONAL_DEFAULT_PROPERTIES += ro.dalvik.vm.native.bridge=libhoudini.so

# Enable frame-exact AV sync
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.avsync=true

# set USB OTG enabled to add support for USB storage type
PRODUCT_PROPERTY_OVERRIDES += persist.sys.isUsbOtgEnabled=1

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp

# Bluetooth
PRODUCT_PACKAGES += \
    bt_bcm4354

PRODUCT_COPY_FILES += \
    device/asus/moorefield/fhd/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
    device/asus/moorefield/fhd/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal 

# IMG graphics
PRODUCT_PACKAGES += \
    IMG_graphics \
    hwcomposer.moorefield

#Video
PRODUCT_COPY_FILES += \
    device/asus/moorefield/fhd/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/moorefield/fhd/media/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
    device/asus/moorefield/fhd/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/asus/moorefield/fhd/media/mfx_omxil_core.conf:system/etc/mfx_omxil_core.conf \
    device/asus/moorefield/fhd/media/video_isv_profile.xml:system/etc/video_isv_profile.xml


# psb video
PRODUCT_PACKAGES += \
    pvr_drv_video

# Media SDK and OMX IL components
PRODUCT_PACKAGES += \
    libmfxsw32 \
    libmfx_omx_core \
    libmfx_omx_components_sw \
    libgabi++-mfx \
    libstlport-mfx

#video firmware
PRODUCT_PACKAGES += \
    msvdx.bin.0008.0000.0000 \
    msvdx.bin.0008.0000.0001 \
    msvdx.bin.0008.0002.0001 \
    msvdx.bin.0008.0000.0002 \
    msvdx.bin.000c.0001.0001 \
    topaz.bin.0008.0000.0000 \
    topaz.bin.0008.0000.0001 \
    topaz.bin.0008.0000.0002 \
    topaz.bin.0008.0002.0001 \
    topaz.bin.000c.0001.0001 \
    vsp.bin.0008.0000.0000 \
    vsp.bin.0008.0000.0001 \
    vsp.bin.0008.0000.0002 \
    vsp.bin.0008.0002.0001 \
    vsp.bin.000c.0001.0001

# libva
PRODUCT_PACKAGES += \
    libva \
    libva-android \
    libva-tpi \
    vainfo

#libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# libmix
PRODUCT_PACKAGES += \
    libmixvbp_mpeg4 \
    libmixvbp_h264 \
    libmixvbp_h264secure \
    libmixvbp_vc1 \
    libmixvbp_vp8 \
    libmixvbp \
    libva_videodecoder \
    libva_videoencoder

PRODUCT_PACKAGES += \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped \
    libOMXVideoDecoderAVC \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoDecoderWMV \
    libOMXVideoDecoderVP8 \
    libOMXVideoDecoderVP9HWR \
    libOMXVideoDecoderVP9Hybrid \
    libOMXVideoEncoderAVC \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4 \
    libOMXVideoEncoderVP8

#libISV
PRODUCT_PACKAGES += libisv_omx_core

# pvr
PRODUCT_PACKAGES += \
    libpvr2d

# libdrm
PRODUCT_PACKAGES += \
    libdrm \
    dristat \
    drmstat

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    lib_driver_cmd_bcmdhd \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    bcmdhd.cal

PRODUCT_COPY_FILES += \
    device/asus/moorefield/fhd/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml

# Key layout files
PRODUCT_COPY_FILES += \
    device/asus/moorefield/fhd/keylayout/ASUS_TransKeyboard.kl:system/usr/keylayout/ASUS_TransKeyboard.kl \
    device/asus/moorefield/fhd/keylayout/ftxxxx_ts.kl:system/usr/keylayout/ftxxxx_ts.kl\
    device/asus/moorefield/fhd/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/asus/moorefield/fhd/keylayout/lm49453-audio_Intel_MID_Audio_Jack.kl:system/usr/keylayout/lm49453-audio_Intel_MID_Audio_Jack.kl \
    device/asus/moorefield/fhd/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

#GFX Config
PRODUCT_COPY_FILES += \
    device/asus/moorefield/fhd/powervr.ini:system/etc/powervr.ini

# Thermal itux
ENABLE_ITUXD := true
PRODUCT_PACKAGES += \
    ituxd

# Power HAL
PRODUCT_PACKAGES += \
    power.fhd

$(call inherit-product-if-exists, vendor/asus/moorefield/fhd/fhd-vendor.mk)
$(call inherit-product-if-exists, vendor/intel/PRIVATE/fhd/device-vendor.mk)
$(call inherit-product-if-exists, vendor/intel/moorefield/prebuilts/houdini/houdini.mk)

# Add WiFi Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4354/device-bcm.mk)

# specific management of sep_policy.conf
PRODUCT_COPY_FILES += \
    device/asus/moorefield/fhd/sep_policy.conf:system/etc/security/sep_policy.conf

