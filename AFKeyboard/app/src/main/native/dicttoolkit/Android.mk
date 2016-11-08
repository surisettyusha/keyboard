LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LATIN_IME_CORE_PATH := $(LOCAL_PATH)/../jni
LATIN_IME_DICT_TOOLKIT_SRC_DIR := src
LATIN_IME_CORE_SRC_DIR := ../jni/src
LOCAL_CFLAGS += -std=c++11 -Wno-unused-parameter -Wno-unused-function
include $(LOCAL_PATH)/NativeFileList.mk
include $(LATIN_IME_CORE_PATH)/NativeFileList.mk
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(LATIN_IME_DICT_TOOLKIT_SRC_DIR) \
    $(LATIN_IME_CORE_PATH)/$(LATIN_IME_CORE_SRC_DIR)
LOCAL_SRC_FILES := $(LATIN_IME_DICT_TOOLKIT_MAIN_SRC_FILES) \
    $(addprefix $(LATIN_IME_DICT_TOOLKIT_SRC_DIR)/, $(LATIN_IME_DICT_TOOLKIT_SRC_FILES)) \
    $(addprefix $(LATIN_IME_CORE_SRC_DIR)/, $(LATIN_IME_CORE_SRC_FILES))
LOCAL_MODULE := dicttoolkit
LOCAL_CXX_STL := libc++


#################### Clean up the tmp vars
include $(LOCAL_PATH)/CleanupNativeFileList.mk
#################### Unit test
include $(LOCAL_PATH)/UnitTests.mk


