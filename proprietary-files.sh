#!/bin/sh

VENDOR=samsung
DEVICE=golden

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull /$FILE $BASE/$FILE
done

./setup-makefiles.sh
