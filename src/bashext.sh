## Load in a list of files to source into bash

bashext_default_path="${HOME}/bin"

## Include configuration file
source "${HOME}/.bashext.conf"

function _echo_info () {
	echo "Loading bash_ext extensions..."
}

function bashext_help () {
	## Print help info
	echo "bashext, written by Matthew Stobbs \<matthew@sproutingcommunications.com\>, primarily for Matthew Stobbs \<matthew@sproutingcommunications.com\>"
	echo "Liscened under GPL3"
	echo ""
	echo ""
	echo "This comes with NO WARRANTY WHATSOEVER. If it breaks your system, disable it"
}

EXT_START=('_echo_info')

if [ "$DISABLE_BASH_EXT" != "yes" ]; then
	for ext in ${BASH_PLUGINS[@]}
	do
		if [ -e "${bashext_default_path}/${ext}.sh" ]; then
			source "${bashext_default_path}/${ext}.sh"
		fi
	done

	if [ "$EXT_START" != "" ]; then
		for ext_func in ${EXT_START[@]}
		do
			$ext_func
		done
	fi
fi
