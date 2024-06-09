# Gramophone
TARGET_INCLUDE_GRAMOPHONE ?= true
ifeq ($(TARGET_INCLUDE_GRAMOPHONE),true)
PRODUCT_PACKAGES += \
    Gramophone
endif

# Omni
TARGET_INCLUDE_OMNI ?= true
ifeq ($(TARGET_INCLUDE_OMNI),true)
PRODUCT_PACKAGES += \
    Omni
endif
