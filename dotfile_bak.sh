#! /bin/bash

set -x

HOME=~
TAR_FILE=dotfile.tar.xz

# FIXME: os depend
DEFAULT_FILES=".bash_aliases .bashrc .gitconfig .inputrc .tmux.conf .vimrc"

#
# Command line handling
#
usage()
{
	echo "Usage: $0 [options] PATH_TO_HOME"
    echo "    -o TAR_NAME    target tar achiever(.xz)"
	echo "    *must* run in it self dir"

    exit 0
}

while getopts 'o:h' OPT; do
    case $OPT in
        o)
            TAR_FILE="$OPTARG";;
        h)
            usage;;
        ?)
            usage;;
    esac
done

failed_exit()
{
    echo "$0: $1"
    exit 1
}

run_path=`pwd`

test -e $run_path/dotfile_bak.sh || failed_exit "dotfile_bak *must* run in it self dir"

test $TAR_FILE != ${TAR_FILE%*.xz} || failed_exit "target tar achiever must be .xz"

test ! -e $TAR_FILE || rm $TAR_FILE

shift $((OPTIND-1))
test x$1 = x || HOME=$1

if test -d $HOME; then
    tar -C $HOME -cJf $TAR_FILE $DEFAULT_FILES
fi
