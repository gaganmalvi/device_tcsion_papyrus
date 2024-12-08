$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# These additionals go to /default.prop
ADDITIONAL_DEFAULT_PROPERTIES +=
    ro.secure=0 \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    persist.service.acm.enable=0 \
    persist.sys.usb.config=mtp \
    ro.mount.fs=EXT4 \
    debug.hwui.render_dirty_regions=false \
    persist.radio.multisim.config=ss \
    ro.telephony.ril_class=MT6580 \
    ro.telephony.ril.config=signalstrength \
    ro.telephony.sim.count=2 \
    ro.mtk_gps_support=1 \
    ro.mtk_agps_app=1

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/tcsion/papyrus/papyrus-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/tcsion/papyrus/overlay
PRODUCT_PACKAGE_OVERLAYS += device/tcsion/papyrus/overlay # enable this to be able overlay a default wallpaper

LOCAL_PATH := device/tcsion/papyrus

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_PACKAGES += \
    libmtk_symbols

# Audio
PRODUCT_PACKAGES += \
    audio.usb.default \
    audio.r_submix.default

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/root/fstab.mt6580:root/fstab.mt6580 \
    $(LOCAL_PATH)/rootdir/root/init.mt6580.rc:root/init.mt6580.rc \
    $(LOCAL_PATH)/rootdir/root/init.aee.rc:root/init.aee.rc \
    $(LOCAL_PATH)/rootdir/root/init.environ.rc:root/init.environ.rc \
    $(LOCAL_PATH)/rootdir/root/init.common_svc.rc:root/init.common_svc.rc \
    $(LOCAL_PATH)/rootdir/root/init.nvdata.rc:root/init.nvdata.rc \
    $(LOCAL_PATH)/rootdir/root/init.rilproxy.rc:root/init.rilproxy.rc \
    $(LOCAL_PATH)/rootdir/root/init.connectivity.rc:root/init.connectivity.rc \
    $(LOCAL_PATH)/rootdir/root/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/root/init.recovery.mt6580.rc:root/init.recovery.mt6580.rc \
    $(LOCAL_PATH)/rootdir/root/init.mt6580.usb.rc:root/init.mt6580.usb.rc \
    $(LOCAL_PATH)/rootdir/root/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/rootdir/root/ueventd.mt6580.rc:root/ueventd.mt6580.rc \
    $(LOCAL_PATH)/rootdir/root/init.project.rc:root/init.project.rc \
    $(LOCAL_KERNEL):kernel

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    $(LOCAL_PATH)/rootdir/system/etc/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    $(LOCAL_PATH)/rootdir/system/etc/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml 

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Torch
PRODUCT_PACKAGES += \
    Torch

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# Camera
PRODUCT_PACKAGES += \
    Snap

# GPS
PRODUCT_PACKAGES += \
    gps.mt6580

# MiraVision
PRODUCT_PACKAGES += \
    MiraVision
	
# Power
PRODUCT_PACKAGES += \
    power.mt6580

# extra libs
PRODUCT_PACKAGES += \
    libion \
    libtinyxml \
    libtinycompress

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
