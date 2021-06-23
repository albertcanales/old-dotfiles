#!/bin/bash

devpath="/dev/sda4"

function is_mount {
    out=$(udisksctl info -b $devpath | grep MountPoints)
    [[ $out == */* ]] && mounted=1 || mounted=0
}

function mount {
    is_mount
    [[ $mounted -eq 0 ]] && udisksctl mount -b $devpath;
}

function umount {
    is_mount
    [[ $mounted -eq 1 ]] && udisksctl unmount -b $devpath;
} 

function cdades {
    mount
    newpath=$(udisksctl info -b $devpath | grep MountPoints)
    cd ${newpath:24}
}

if [ $# -gt 0 ]; then
    case $1 in
        -m)
            mount
            ;;
        -u)
            umount
            ;;
        *)
            cdades
            ;;
    esac
else
    cdades
fi
