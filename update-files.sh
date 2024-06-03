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

function getAkaneFoundationApks() {
    # Akane Foundation
    local akane_fdn_dir=$COMMON_DIR/AkaneFoundation

    # Gramophone
    local acc_name=AkaneTan
    local app_name=Gramophone
    local app_file='Gramophone.*.apk'
    local target_dir="$akane_fdn_dir/common/product/app/$app_name"
    getApkFromOnline $acc_name $app_name $app_file $target_dir

    # Omni
    local acc_name=AkaneFoundation
    local app_name=Omni
    local app_file='app-release.apk'
    local target_dir="$akane_fdn_dir/common/product/app/$app_name"
    getApkFromOnline $acc_name $app_name $app_file $target_dir
}

function getMicroG() {
    # microG Project
    local microg_proj_dir=$COMMON_DIR/microG

    # GmsCore
    local acc_name=microg
    local app_name=GmsCore
    local app_file='com.google.android.gms.*[0-9].apk'
    local target_dir="$microg_proj_dir/common/product/priv-app/$app_name"
    getApkFromOnline $acc_name $app_name $app_file $target_dir

    # PhoneskyCompanion
    local acc_name=microg
    local app_name=PhoneskyCompanion
    local app_file=' com.android.vending.*[0-9].apk '
    local target_dir="$microg_proj_dir/common/product/priv-app/$app_name"
    getApkFromOnline $acc_name "GmsCore" $app_file $target_dir

    # GsfProxy
    local acc_name=microg
    local app_name=GsfProxy
    local app_file='GsfProxy.apk'
    local target_dir="$microg_proj_dir/common/system_ext/priv-app/$app_name"
    getApkFromOnline $acc_name $app_name $app_file $target_dir
}

getAkaneFoundationApks
getMicroG

unset COMMON_DIR
