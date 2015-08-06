#!/bin/sh

set -e

export DEVICE=Z00A
export VENDOR=asus
./../../$VENDOR/mofd-common/setup-makefiles.sh $@
