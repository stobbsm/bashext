#!/bin/bash

if [ -z "$1" ]; then
	echo "Requires the file to download"
	exit 1
fi

url=$1
filename=$(echo $url | awk -F/ '{print $NF}')

function filter {
	extension=$(echo $1 | awk -F. '{print $NF}')

	case $extension in
		gz|tgz) tar_args='zx' ;;
		xz) tar_args='Jx' ;;
		bz2) tar_args='jx' ;;
		tar) tar_args='x' ;;
		*) echo "Extention $extension not supported"
			exit 1
		;;
	esac
	echo $tar_args
}

curl $url | tar $(filter $filename)
