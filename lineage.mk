# Release name
PRODUCT_RELEASE_NAME := papyrus

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/tcsion/papyrus/lineage_papyrus.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := papyrus
PRODUCT_NAME := lineage_papyrus
PRODUCT_BRAND := tcsion
PRODUCT_MODEL := Papyrus
PRODUCT_MANUFACTURER := tcsion

# SuperUser
WITH_SU := false
WITH_ROOT := false
