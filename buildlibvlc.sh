#!/bin/sh

tag='3.0.97'

rootdir=`dirname $0`

checkfail()
{
    if [ ! $? -eq 0 ];then
        echo "'$1' failed"
        exit 1
    fi
}

if [ ! -d "${rootdir}/vlc-android" ]; then
    echo "VLC Android source not found, cloning"
    git clone https://code.videolan.org/videolan/vlc-android.git
    checkfail "git clone"
    sh -c "cd ${rootdir}/vlc-android && ./compile.sh"
fi

sh -c "cd ${rootdir}/vlc-android && ./compile.sh -l -a $* -r"
checkfail "./vlc-android/compile.sh -a $*"
