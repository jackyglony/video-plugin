##
##
## Copyright 2008, The Android Open Source Project
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions
## are met:
##  * Redistributions of source code must retain the above copyright
##    notice, this list of conditions and the following disclaimer.
##  * Redistributions in binary form must reproduce the above copyright
##    notice, this list of conditions and the following disclaimer in the
##    documentation and/or other materials provided with the distribution.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
## EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
## PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE COMPUTER, INC. OR
## CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
## EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
## PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
## PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
## OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
## (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
## OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

MY_ANDROID_ROOT := /home/chenzhengyong/android/source/eclair

LOCAL_SRC_FILES := \
	main.cpp \
	PluginObject.cpp \
	animation/AnimationPlugin.cpp \
	audio/AudioPlugin.cpp \
	background/BackgroundPlugin.cpp \
	form/FormPlugin.cpp \
	paint/PaintPlugin.cpp \
	jni-bridge.cpp \

LOCAL_C_INCLUDES += \
	$(JNI_H_INCLUDE) \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/animation \
	$(LOCAL_PATH)/audio \
	$(LOCAL_PATH)/background \
	$(LOCAL_PATH)/form \
	$(LOCAL_PATH)/paint \
	$(MY_ANDROID_ROOT)/external/webkit/WebCore/bridge \
	$(MY_ANDROID_ROOT)/external/webkit/WebCore/plugins \
	$(MY_ANDROID_ROOT)/external/webkit/WebCore/platform/android/JavaVM \
	$(MY_ANDROID_ROOT)/external/webkit/WebKit/android/plugins \
	$(MY_ANDROID_ROOT)/dalvik/libnativehelper/include/nativehelper \
	$(MY_ANDROID_ROOT)/frameworks/base/include \
	$(MY_ANDROID_ROOT)/system/core/include

LOCAL_LDLIBS := -lnativehelper \
				-L$(MY_ANDROID_ROOT)/out/target/product/generic/system/lib

LOCAL_CFLAGS += -fvisibility=hidden 
LOCAL_PRELINK_MODULE:=false

LOCAL_MODULE:= libsampleplugin

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

