FDEVICE="rubyfish"

one_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      ONE_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && ONE_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$ONE_BUILD_DEVICE" ]; then
   one_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$ONE_BUILD_DEVICE" = "$FDEVICE" ]; then
    
	export ALLOW_MISSING_DEPENDENCIES=true
	export ONE_USE_TWRP_RECOVERY_IMAGE_BUILDER=1

    # Device Tree Path | Include Path
    export DEVICE_PATH="device/mobvoi/rubyfish"
    export INCLUDE_PATH="$DEVICE_PATH/include"

	export ONE_R11=1
	export OF_PATCH_AVB20=1
	export OF_USE_MAGISKBOOT=0
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=0
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export ONE_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export ONE_REPLACE_BUSYBOX_PS=1
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	export OF_FBE_METADATA_MOUNT_IGNORE=1
	export ONE_DELETE_AROMAFM=1
    export OF_USE_SYSTEM_FINGERPRINT=1
    export OF_CHECK_OVERWRITE_ATTEMPTS=1
    #export ONE_USE_SPECIFIC_MAGISK_ZIP="$INCLUDE_PATH/Magisk-v21.4.zip"

    # About Settings
    export OF_MAINTAINER="BadWolf"
    export ONE_VERSION="1.0"
    export OF_MAINTAINER_AVATAR="$INCLUDE_PATH/BADWOLF.png"
    export ONE_BUILD_TYPE="Stable"

	export ONE_BUGGED_AOSP_ARB_WORKAROUND="1510672800"; # Tue Nov 14 15:20:00 GMT 2017
	export ONE_USE_BASH_SHELL=1
	export ONE_ASH_IS_BASH=1
	export ONE_USE_NANO_EDITOR=1
	export ONE_USE_TAR_BINARY=1
	export ONE_USE_ZIP_BINARY=1
	export ONE_USE_SED_BINARY=1
	export ONE_USE_XZ_UTILS=1
	export OF_USE_GREEN_LED=1

	export ONE_REMOVE_AAPT=0
    export ONE_DISABLE_APP_MANAGER=0
    export ONE_ENABLE_APP_MANAGER=1

    # A6020 Specific
	export TARGET_DEVICE_ALT="rubyfish"
    export OF_TARGET_DEVICES="rubyfish"
    export ONE_USE_LZMA_COMPRESSION=1
    export OF_ALLOW_DISABLE_NAVBAR=0

    export OF_USE_TWRP_SAR_DETECT="1"

    # OTA for Custom ROMs
    export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
    export OF_NO_MIUI_OTA_VENDOR_BACKUP=1
    export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1

	# quick backup defaults
    export OF_QUICK_BACKUP_LIST="/boot;/data;/system_image;/persist;/vendor;"

	# Run a Process After Formatting Data to Work-Around MTP Issues
	export OF_RUN_POST_FORMAT_PROCESS=1

	export LC_ALL="C"

    # Maintainer's Avatar Settings
    if [ -n "$OF_MAINTAINER_AVATAR" ]; then
        if [ ! -f "$OF_MAINTAINER_AVATAR" ]; then
              # Some Colour Codes:
              RED='\033[0;31m'
              GREEN='\033[0;32m'
              ORANGE='\033[0;33m'
              BLUE='\033[0;34m'
              PURPLE='\033[0;35m'
              echo -e "${RED}-- File \"$OF_MAINTAINER_AVATAR\" not found  ...${NC}"
              echo -e "${ORANGE}-- Downloading...${NC}"
              mkdir -p misc/
              curl https://avatars.githubusercontent.com/u/18737095?v=4 >> $OF_MAINTAINER_AVATAR
              echo -e "${BLUE}-- Successfully Downloaded the Avatar Image \"$OF_MAINTAINER_AVATAR\" ...${NC}"
              echo -e "${PURPLE}-- Using A Custom Maintainer Avatar from the Downloaded Image \"$OF_MAINTAINER_AVATAR\" ...${NC}"
              echo -e "${GREEN}-- Done!"
        fi
    fi

	# let's see what are our build VARs
	if [ -n "$ONE_BUILD_LOG_FILE" -a -f "$ONE_BUILD_LOG_FILE" ]; then
  	   export | grep "ONE" >> $ONE_BUILD_LOG_FILE
  	   export | grep "OF_" >> $ONE_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $ONE_BUILD_LOG_FILE
  	   export | grep "TW_" >> $ONE_BUILD_LOG_FILE
 	fi

fi
#

