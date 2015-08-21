USERPATHS=(
	'/home/stobbsm/.gem/ruby/2.2.0/bin'
	'/home/stobbsm/bin'
	'/home/stobbsm/.composer/vendor/bin'
)

EXT_START+=('build_path')

function build_path () {
	for path in "${USERPATHS[@]}"
	do
		echo $PATH | grep $path &>/dev/null 
		in_path=$?

		if [ "$in_path" != "0" ]; then
			ls $path &>/dev/null
			is_valid=$?

			if [ "$is_valid" = "0" ]; then
				PATH=$PATH:$path
			fi
		fi
	done
	export PATH=$PATH
}
