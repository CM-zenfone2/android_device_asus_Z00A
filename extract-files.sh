#!/bin/sh

set -e

export DEVICE=Z00A
export VENDOR=asus
./../../$VENDOR/mofd-common/extract-files.sh $@