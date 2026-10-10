# PixelithOS: wire Clover GMS into Lineage without touching device trees.
# Lineage's config/common.mk already does `-include vendor/lineage/config/partner_gms.mk`,
# so this file is the single injection point.
ifeq ($(WITH_GMS),true)
WITH_GMS_COMMS_SUITE ?= true

# Keep device's own client ID (e.g. android-nothing) when set.
PRODUCT_GMS_CLIENTID_BASE ?= android-google

# AOSP base sets ro.config.{ringtone,notification_sound,alarm_alert} to
# Orion/Argon/Hassium; Pixel sounds.mk sets Pixel defaults. Newer Soong treats
# that as a fatal duplicate, so allow last-wins. This include is last in the
# product inheritance chain, so Pixel values win.
BUILD_BROKEN_DUP_SYSPROP := true

$(call inherit-product, vendor/pixel/gms/products/gms.mk)
$(call inherit-product, vendor/pixel/launcher/products/launcher.mk)
$(call inherit-product, vendor/pixel/sounds/products/sounds.mk)
$(call inherit-product, vendor/pixel/themepicker/products/themepicker.mk)
endif
