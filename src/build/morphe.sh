#!/bin/bash
# Morphe build
source ./src/build/utils.sh
# Download requirements
morphe_dl(){
	dl_gh "morphe-patches" "MorpheApp" "latest"
	dl_gh "morphe-desktop" "MorpheApp" "latest"
}
1() {
	morphe_dl
	# Patch YouTube:
	#get_patches_key "youtube-morphe"
	#get_apk "com.google.android.youtube" "youtube" "apk"
	#patch "youtube" "morphe"
	# Remove unused architectures
	#for i in {0..3}; do
	#	split_arch "youtube" "morphe"
	#done
	# Patch Youtube Arm64-v8a
	get_patches_key "youtube-morphe"
	get_apk "com.google.android.youtube" "youtube" "bundle_extract"
	split_editor "youtube" "youtube-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "youtube-arm64-v8a" "morphe"
	# Patch Youtube Armeabi-v7a
	#get_patches_key "youtube-morphe"
	#split_editor "youtube" "youtube-armeabi-v7a" "exclude" "split_config.arm64_v8a split_config.x86 split_config.x86_64"
	#patch "youtube-armeabi-v7a" "morphe"
	# Patch Youtube x86
	#get_patches_key "youtube-morphe" 
	#split_editor "youtube" "youtube-x86" "exclude" "split_config.arm64_v8a split_config.armeabi_v7a split_config.x86_64"
	#patch "youtube-x86" "morphe"
	# Patch Youtube x86_64
	#get_patches_key "youtube-morphe"
	#split_editor "youtube" "youtube-x86_64" "exclude" "split_config.arm64_v8a split_config.armeabi_v7a split_config.x86"
	#patch "youtube-x86_64" "morphe"
}
case "$1" in
    1)
        1
        ;;
esac
