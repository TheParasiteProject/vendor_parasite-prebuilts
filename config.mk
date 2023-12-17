# Gramophone
TARGET_INCLUDE_GRAMOPHONE ?= true
ifeq ($(TARGET_INCLUDE_GRAMOPHONE),true)
PRODUCT_PACKAGES += \
    Gramophone
endif
