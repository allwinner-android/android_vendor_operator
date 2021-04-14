# Copyright (C) 2010 The Android Open Source Project
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

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := basicService
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SWLauncher
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_ControlServer
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Guide
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_startup
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Downloader
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Login
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Settings
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
#LOCAL_OVERRIDES_PACKAGES := TvdSettings
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Upgrade
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Upgrade_usb
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Xmpp
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_NetworkInfo
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Pay
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Installer
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_ControlServer_wimo
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Diagnostic
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_DeviceManger
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_FJSpeedup
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_ScreenSaver
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)


#######################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_IME2
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_OVERRIDES_PACKAGES := PinyinIME LatinIME
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)


# do not need system signature
####################################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_WasuOTT_2.1.7.35
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

####################################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_wimo
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

####################################
include $(CLEAR_VARS)
LOCAL_MODULE := ChinaMobileOttItv
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

####################################
include $(CLEAR_VARS)
LOCAL_MODULE := icntv-viper-shmobile-V5.1.16.3.16-fixSettingsBack
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_PREBUILT_JNI_LIBS := \
    lib/arm/libckeygenerator_4_1.so \
    lib/arm/libQQMMANDKSignature.so \
    lib/arm/libsta_jni.so \
    lib/arm/libgefo.so \
    lib/arm/libIWAVLogin.so \
    lib/arm/libIYstLogin.so \
    lib/arm/libShellCommand.so \
    lib/arm/libyst-android.so \
    lib/arm/libyst-base.so \
    lib/arm/libyst-ime.so \
    lib/arm/libyst-network.so \
    lib/arm/libyst-player.so \
    lib/arm/libyst-service.so \
    lib/arm/libyst-widget.so \
    lib/arm/libyst-widgetmanager.so
include $(BUILD_PREBUILT)

####################################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_LocalPlayer
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
#LOCAL_OVERRIDES_PACKAGES := TvdVideo
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

####################################
include $(CLEAR_VARS)
LOCAL_MODULE := SHCMCC_Player
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := AppStore_YD_OTT_V2.4.1_product
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := EVQA_sihua_cmvideo_1.32.160505
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

#########################################
include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libtxcore20141017_59.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)

#########################################
##for the app called threepigs
include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libcocos2djs.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)
#########################################
##for the app called threepigs
include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libmegjb.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)
#########################################
##for the app called threepigs
include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libsjCommandMonster.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)
#########################################
##for the app called threepigs
include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libxingjieAoteman.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)
#########################################
##for the app called threepigs
include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libxingjiezhuzhuxia.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)
#########################################

include $(CLEAR_VARS)
LOCAL_MODULE := BesTV_Lite_YDJD_3.1.1603.1
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

####################################

include $(CLEAR_VARS)
LOCAL_MODULE := MiguAichang_V1.9.012
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_PREBUILT_JNI_LIBS := \
    lib/arm/libaac-encoder.so \
    lib/arm/liballjoyn_java.so \
    lib/arm/libblurjni.so \
    lib/arm/libgenius.so \
    lib/arm/libijkffmpeg.so \
    lib/arm/libijkplayer.so \
    lib/arm/libijksdl.so \
    lib/arm/libijkutil.so \
    lib/arm/libndkbitmap.so \
    lib/arm/libSesLocalEngine.so \
    lib/arm/liblocSDK3.so \
    lib/arm/libmsc.so \
    lib/arm/libsamplerateconvert.so
include $(BUILD_PREBUILT)

#########################################
##used for icntv migu

include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libgifimage.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)
#########################################
##used for icntv migu

include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libimagepipeline.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)
#########################################
##used for icntv migu

include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libmemchunk.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)
#########################################
##used for icntv migu

include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libwebp.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)
#########################################
##used for icntv migu

include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := libwebpimage.so

LOCAL_MODULE_TAGS := optional

include $(BUILD_MULTI_PREBUILT)
#########################################
include $(CLEAR_VARS)
LOCAL_MODULE := SoftDetector_V2.0.1_20160811_7541_x021
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
include $(BUILD_PREBUILT)

####################################
include $(CLEAR_VARS)
LOCAL_MODULE := libpcapcmcc.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################