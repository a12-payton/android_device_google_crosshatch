#
# Copyright 2017 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,default-permissions.xml,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,libnfc-nci.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,fstab.postinstall,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,ueventd.rc,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,wpa_supplicant.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,hals.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,media_profiles_V1_0.xml,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,media_codecs_performance.xml,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,device_state_configuration.xml,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,task_profiles.json,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,p2p_supplicant.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,wpa_supplicant.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,device/google/crosshatch,wpa_supplicant_overlay.conf,SPDX-license-identifier-Apache-2.0,notice,build/soong/licenses/LICENSE,))

$(eval $(call declare-1p-copy-files,device/google/crosshatch,audio_policy_configuration.xml))

ifeq ($(USES_DEVICE_GOOGLE_B1C1),true)
  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

RFS_MSM_ADSP_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/adsp/
$(RFS_MSM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM ADSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/lpass $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

RFS_MSM_CDSP_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/cdsp/
$(RFS_MSM_CDSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM CDSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/cdsp $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/cdsp $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

RFS_MSM_MPSS_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/mpss/
$(RFS_MSM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM MPSS folder structure: $@"
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/wifidump $@/ramdumps
	$(hide) ln -sf /data/vendor/rfs/mpss $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

RFS_MSM_SLPI_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/slpi/
$(RFS_MSM_SLPI_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM SLPI folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/slpi $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/slpi $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

CNE_LIBS := libvndfwk_detect_jni.qti.so
CNE_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/app/CneApp/lib/arm64/,$(notdir $(CNE_LIBS)))
$(CNE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "CneApp lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib64/$(notdir $@) $@

IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT_SYSTEM_EXT)/priv-app/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/$(notdir $@) $@

DM_LIBS := libdmengine.so libdmjavaplugin.so
DM_SYMLINKS := $(addprefix $(TARGET_OUT_PRODUCT)/priv-app/DMService/lib/arm/,$(notdir $(DM_LIBS)))
$(DM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "DMService lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MSM_ADSP_SYMLINKS) $(RFS_MSM_CDSP_SYMLINKS) $(RFS_MSM_MPSS_SYMLINKS) $(RFS_MSM_SLPI_SYMLINKS) $(CNE_SYMLINKS) $(IMS_SYMLINKS) $(DM_SYMLINKS)

endif
