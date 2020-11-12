#!/bin/bash
#****************************************************************************
#*
#*  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
#*
#*  This code is licensed under the GPLv3.
#*
#****************************************************************************
# Generate version c file based on git state
#****************************************************************************

SW_REVISION="$(git show --no-patch --no-notes --pretty='%h' HEAD)"
SW_DATE="$(git show --no-patch --no-notes --pretty='%cd' --date=short HEAD)"

if [[ "$(git status --porcelain)" ]]; then
    SW_REVISION=$SW_REVISION"_dirty"
fi

echo "/*"                                                            > $1
echo "************************************************************" >> $1
echo "**    auto generated"                                         >> $1
echo "************************************************************" >> $1
echo "*/"                                                           >> $1
echo                                                                >> $1
echo "const char sw_version_id[]   = \"$SW_REVISION\";"             >> $1
echo "const char sw_version_date[] = \"$SW_DATE\";"                 >> $1
