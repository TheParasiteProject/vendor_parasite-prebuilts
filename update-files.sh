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

unset COMMON_DIR
