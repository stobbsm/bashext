#!/bin/bash

## Not meant for direct execution

## Get correct tools
_curl=`which curl`
_tar=`which tar`

function tar_remote () {
	local tar_opts="$1"
	local remote_file="$2"

	$_curl "$remote_file" | $_tar $1 -
}

function rbash () {
	source "${HOME}/.bashrc"
}
