
DEVICE_PACKAGE_OVERLAYS += \
    vendor/cmccwasu/overlay \

#define BUSINESS PLATFORM
TARGET_BUSINESS_PLATFORM := cmccwasu

#build external.jar, which contains cmcc-wasu api
PRODUCT_PACKAGES += \
    external

PRIVATE_BOOT_JARS := external

# preinstall huasu apk
PRODUCT_PACKAGES += \
	SHCMCC_IME2 \
	SHCMCC_NetworkInfo \
	SHCMCC_Xmpp \
	SHCMCC_wimo \
	SHCMCC_Diagnostic \
	SHCMCC_DeviceManger \
	SWLauncher \
	SHCMCC_Downloader \
	SHCMCC_Login \
	SHCMCC_LocalPlayer \
	SHCMCC_Upgrade_usb \
	SHCMCC_Guide \
	SHCMCC_Settings \
	icntv-viper-shmobile-V5.1.16.3.16-fixSettingsBack \
	SHCMCC_Upgrade \
	SHCMCC_Player \
	cmccwasu_systemservice \
	cmccwasu_server \
	TvdFileManager \
	TvdVideo \
	AppStore_YD_OTT_V2.4.1_product \
	libtxcore20141017_59 \
	libgefo \
	libIWAVLogin \
	libyst-base \
	libyst-ime \
	libyst-player \
	libyst-service \
	libyst-widget \
	libyst-widgetmanager \
	libIYstLogin \
	libShellCommand \
	libyst-android \
	libyst-network \
	libckeygenerator_4_1 \
	libQQMMANDKSignature \
	libsta_jni \
	EVQA_sihua_cmvideo_1.32.160505 \
	basicService \
	SHCMCC_ControlServer \
	SHCMCC_ControlServer_wimo \
	SHCMCC_FJSpeedup \
	SHCMCC_Pay \
	SHCMCC_ScreenSaver \
	SHCMCC_startup \
	AllCast \
	MiracastReceiver \
	Gallery2 \
	Music \
	Settings \
	libgpio_jni \
	SHCMCC_WasuOTT_2.1.7.35 \
	libaac-encoder \
	liballjoyn_java \
	libblurjni \
	libijkffmpeg \
	libijkplayer \
	libijksdl \
	libijkutil \
	liblocSDK3 \
	libmsc \
	libndkbitmap \
	libgenius \
	libsamplerateconvert \
	libSesLocalEngine \
	libbitmaps \
	libgifimage \
	libimagepipeline \
	libmemchunk \
	libwebp \
	libwebpimage \
	MiguAichang_V1.9.012 \
	SoftDetector_V2.0.1_20160811_7541_x021 \
	libpcapcmcc.so \
	BesTV_Lite_YDJD_3.1.1603.1
	
	
PRODUCT_COPY_FILES += \
	vendor/operator/cmcc/packages/SHCMSYSTEM_useraccount.jar:/system/framework/SHCMSYSTEM_useraccount.jar \
	vendor/operator/cmcc/packages/shcmsystem.jar:/system/framework/shcmsystem.jar \
	vendor/operator/cmcc/init.cmcccntv.rc:root/init.cmcccntv.rc
	
PRODUCT_PROPERTY_OVERRIDES += \
	ro.media.timeshift=1 \
	sys.settings.support=1 \
	sys.settings.support.net.flags=7 \
	sys.settings.support.ap.flags=1 \
	epg.launcher.packagename=net.sunniwell.launcher.chinamobile \
	sys.deepdiagnose.support=1 \
	ro.hwc.sysrsl=5 \
	ro.deviceid=111013440047611
	
# do not modify this property
PRODUCT_PROPERTY_OVERRIDES += \
	ro.business.platform=cmccwasu \
	ro.sw.defaultlauncherpackage=net.sunniwell.launcher.chinamobile \
	ro.sw.defaultlauncherclass=net.sunniwell.launcher.chinamobile.MainActivity
