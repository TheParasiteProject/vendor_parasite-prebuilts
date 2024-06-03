# microG
ifeq ($(TARGET_INCLUDE_MICROG),true)
# microG Core
PRODUCT_PACKAGES += \
    GmsCore \
    GsfProxy

# microG Companion
ifeq ($(TARGET_INCLUDE_MICROG_COMPANION),true)
PRODUCT_PACKAGES += \
    PhoneskyCompanion
endif

# Maps framework
PRODUCT_PACKAGES += \
    com.google.android.maps

# Overlays
PRODUCT_PACKAGES += \
    microGConfigOverlay

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(PARASITE_PREBUILTS)/common/microG
endif
