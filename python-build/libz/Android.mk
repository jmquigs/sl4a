LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

zlib_files := \
	adler32.c \
	compress.c \
	crc32.c \
	gzio.c \
	uncompr.c \
	deflate.c \
	trees.c \
	zutil.c \
	inflate.c \
	infback.c \
	inftrees.c \
	inffast.c

LOCAL_SRC_FILES := $(zlib_files)
LOCAL_MODULE := libz
LOCAL_MODULE_FILENAME := 
LOCAL_CFLAGS += -O
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

$(call __ndk_info, Building zlib)
$(call __ndk_info, PATH: $(LOCAL_PATH))
$(call __ndk_info, MODULE: $(LOCAL_MODULE))
$(call __ndk_info, FILENAME: $(LOCAL_MODULE_FILENAME))
$(call __ndk_info, SRC: $(LOCAL_SRC_FILES))
$(call __ndk_info, INCLUDES: $(LOCAL_C_INCLUDES))
$(call __ndk_info, EXPORT: $(LOCAL_EXPORT_C_INCLUDES))

include $(BUILD_STATIC_LIBRARY)
