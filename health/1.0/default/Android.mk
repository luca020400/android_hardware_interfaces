LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.health@1.0-impl
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_C_INCLUDES := system/core/healthd/include system/core/base/include
LOCAL_SRC_FILES := \
    Health.cpp \

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libhidl \
    libhwbinder \
    liblog \
    libutils \
    android.hardware.health@1.0 \

LOCAL_STATIC_LIBRARIES := android.hardware.health@1.0-convert

LOCAL_HAL_STATIC_LIBRARIES := libhealthd

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.health@1.0-convert
LOCAL_SRC_FILES := convert.cpp
LOCAL_C_INCLUDES := system/core/healthd/include system/core/base/include
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libhidl \
    libutils \
    android.hardware.health@1.0 \

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := android.hardware.health@1.0-service
LOCAL_INIT_RC := android.hardware.health@1.0-service.rc
LOCAL_SRC_FILES := \
    HealthService.cpp \

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libcutils \
    libdl \
    libbase \
    libutils \
    libhwbinder \
    libhidl \
    android.hardware.health@1.0 \

include $(BUILD_EXECUTABLE)

include $(call first-makefiles-under,$(LOCAL_PATH))
