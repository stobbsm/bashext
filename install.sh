#!/bin/bash

## Installs bash_ext to default path

INSTALL_PATH="${HOME}/bin"

echo "Installing to '$INSTALL_PATH'"

if [ ! -e "$INSTALL_PATH" ]; then
	mkdir -pv "$INSTALL_PATH"
fi

FILE_LIST="$(ls src/)"

for file in $FILE_LIST
do
	$(which install) -m 0644 src/$file "$INSTALL_PATH"
done

echo "Installing default configuration"
$(which install) -m 0600 src/.bashext.conf "${HOME}/.bashext.conf"

echo "To make use of bash_ext, source ${INSTALL_PATH}/bashext.sh in your .bashrc"
echo "and edit '${HOME}/.bashext.conf' to your liking"
