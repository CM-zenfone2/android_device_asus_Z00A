ifneq (,$(findstring $(TARGET_DEVICE),fhd))

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := librecovery_updater_fhd
LOCAL_SRC_FILES := recovery_updater.c fw_version_check.c
LOCAL_C_INCLUDES += bootable/recovery

include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES += bootable/recovery system/core/fs_mgr/include
LOCAL_SRC_FILES := recovery_ui.cpp

# should match TARGET_RECOVERY_UI_LIB set in BoardConfig.mk
LOCAL_MODULE := librecovery_ui_fhd

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

endif
