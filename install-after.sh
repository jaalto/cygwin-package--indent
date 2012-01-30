#!/bin/sh
#
# install-after.sh -- Custom installation
#
# The script will receive one argument: relative path to
# installation root directory. Script is called like:
#
#    $ install-after.sh .inst
#
# This script is run after [install] command.

Cmd()
{
    echo "$@"
    [ "$test" ] && return
    "$@"
}

Main()
{
    root=${1:-".inst"}

    if [ "$root"  ] && [ -d $root ]; then

        root=$(echo $root | sed 's,/$,,')  # Delete trailing slash

        # remove unneeded file
        Cmd rm -f $root/usr/bin/texinfo2man.exe

	Cmd mkdir -p $root/usr/share
	Cmd mv $root/usr/doc/*/* $root/usr/share/doc/indent/
        Cmd rm -rf $root/usr/doc

    fi
}

Main "$@"

# End of file
