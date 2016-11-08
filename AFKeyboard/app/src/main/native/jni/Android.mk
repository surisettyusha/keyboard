# Copyright (C) 2011 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

############ some local flags
# If you change any of those flags, you need to rebuild both libjni_latinime_common_static
# and the shared library that uses libjni_latinime_common_static.
FLAG_DBG ?= false
FLAG_DO_PROFILE ?= false

######################################
include $(CLEAR_VARS)

LATIN_IME_SRC_DIR := src

LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(LATIN_IME_SRC_DIR)
LOCAL_C_INCLUDES += /home/robot/Android/Sdk/ndk-bundle/sources/cxx-stl/gnu-libstdc++/4.9/include \
                    /home/robot/Android/Sdk/ndk-bundle/sources/cxx-stl/gnu-libstdc++/4.9/libs/$(TARGET_ARCH)/include \
                    /home/robot/Android/Sdk/ndk-bundle/sources/cxx-stl/gnu-libstdc++/4.9/include/backward

include $(LOCAL_PATH)/NativeFileList.mk
LOCAL_SRC_FILES := \
    $(LATIN_IME_JNI_SRC_FILES) \
    $(addprefix $(LATIN_IME_SRC_DIR)/, $(LATIN_IME_CORE_SRC_FILES))
LOCAL_MODULE := libjni_latinime_common_static

include $(BUILD_STATIC_LIBRARY)
######################################
include $(CLEAR_VARS)

# All code in LOCAL_WHOLE_STATIC_LIBRARIES will be built into this shared library.
LOCAL_WHOLE_STATIC_LIBRARIES := libjni_latinime_common_static

LOCAL_MODULE := libjni_latinime

include $(BUILD_SHARED_LIBRARY)
#################### Clean up the tmp vars
include $(LOCAL_PATH)/CleanupNativeFileList.mk



#################### Unit test on target environment
include $(LOCAL_PATH)/TargetUnitTests.mk
