# Gramophone
TARGET_INCLUDE_GRAMOPHONE ?= true
ifeq ($(TARGET_INCLUDE_GRAMOPHONE),true)
PRODUCT_PACKAGES += \
    Gramophone
endif

# microG
ifeq ($(TARGET_INCLUDE_MICROG),true)
PRODUCT_PACKAGES += \
    GmsCore \
    GsfProxy

PRODUCT_PACKAGES += \
    com.google.android.maps

PRODUCT_PACKAGES += \
    microGConfigOverlay

PRODUCT_COPY_FILES += \
    vendor/parasite-prebuilts/common/microG/common/product/etc/default-permissions/permissions-com.google.android.gms.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/permissions-com.google.android.gms.xml \
    vendor/parasite-prebuilts/common/microG/common/product/etc/permissions/com.google.android.maps.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.maps.xml \
    vendor/parasite-prebuilts/common/microG/common/product/etc/permissions/privapp-permissions-org.microG.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-org.microG.xml \
    vendor/parasite-prebuilts/common/microG/common/product/etc/sysconfig/org.microG.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/org.microG.xml
endif
