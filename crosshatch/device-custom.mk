#
# Copyright (C) 2018-2021 The PixelBuilds Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/crosshatch/crosshatch/overlay-custom

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    device/google/crosshatch/crosshatch/overlay-custom/frameworks/base/packages/overlays/NoCutoutOverlay

$(call inherit-product, device/google/crosshatch/device-custom.mk)
