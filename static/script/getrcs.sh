#!/bin/sh

echo "get rcs from github begin..."

cygwin=false
linux=false
darwin=false
unknow=false

case "`uname`" in
    CYGWIN* )
        cygwin=true
        ;;
    Darwin* )
        darwin=true
        ;;
    Linux* )
        linux=true
        ;;
    * )
        unknow=true
        ;;
esac

if $unknow; then
    echo "unknow operation system, exit!"
    exit 1
fi

RCS_EXE="rcs"

if $cygwin; then
    RCS_EXE="rcs_osx"
fi

if $linux; then
    RCS_EXE="rcs_ubuntu"
fi

if $cygwin; then
    RCS_EXE="rcs_win"
fi

RCS_DEST="~/.rcs"
RCS_DATA_DEST="~/.rcs/data"
RCS_EXE_DEST="~/.rcs/rcs"
mkdir -p "${RCS_DATA_DEST}"
wget -O "$RCS_EXE_DEST"  "https://github.com/kongliangzhong/rcs/blob/master/$RCS_EXE"


if [ -f "$RCS_EXE_DEST" ]; then
    chmod u+x "$RCS_EXE_DEST"
else
    echo "get rcs from github failed."
    exit 2
fi

ln -s /usr/local/rcs "$RCS_EXE_DEST"

echo "get rcs succeeded!"
