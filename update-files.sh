#!/bin/bash

COMMON_DIR=common

function getTargetUrl() {
    echo $(curl -s "https://api.github.com/repos/$1/$2/releases/latest" \
        | grep -e "https.*$3\"" \
        | cut -d : -f 2,3 \
        | tr -d \" \
    )
}

function getFile() {
    aria2c $1 -d $2 -o $3
}

function getApkFromOnline() {
    local acc_name=$1
    local app_name=$2
    local app_file=$3
    local out_file="$app_name".apk
    local target_dir=$4

    rm "$target_dir"/"$app_name".apk

    local target_apk_url=$(getTargetUrl $acc_name $app_name $app_file)

    mkdir -p $target_dir
    getFile $target_apk_url $target_dir $out_file
}

function getGramophone() {
    # Akane Foundation
    local akane_fdn_dir=$COMMON_DIR/AkaneFoundation

    # Gramophone
    local acc_name=AkaneTan
    local app_name=Gramophone
    local app_file='Gramophone.*.apk'
    local target_dir="$akane_fdn_dir/common/product/app/$app_name"

    getApkFromOnline $acc_name $app_name $app_file $target_dir
}

function getMicroG() {
    # microG Project
    local microg_proj_dir=$COMMON_DIR/microG

    # microG
    local acc_name=microG

    local app_names=(
        GmsCore
        GsfProxy
    )

    local app_files=(
        'com.google.android.gms.*[0-9].apk'
        GsfProxy.apk
    )

    local target_dirs=(
        $microg_proj_dir/common/product/priv-app/GmsCore
        $microg_proj_dir/common/system_ext/priv-app/GsfProxy
    )

    for (( i=0; i < ${#app_names[@]}; i++ )); do
        getApkFromOnline $acc_name ${app_names[$i]} ${app_files[$i]} ${target_dirs[$i]}
    done
}

#getGramophone
getMicroG

unset COMMON_DIR
