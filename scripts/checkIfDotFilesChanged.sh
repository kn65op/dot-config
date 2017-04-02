#!/bin/bash

HOME_DOT_FILES_DIR=home-dot-files

if [ ! -d $HOME_DOT_FILES_DIR ]
then
	echo "You should run in root repository directory"
	exit 1
fi

cd $HOME_DOT_FILES_DIR

for FILE in .*
do
	if [ -f $FILE ]
	then
		DIFF_OUTPUT=`diff $FILE ~/$FILE`
		if [ $? -ne 0 ]
		then
			echo "File $FILE differ:"
			echo "$DIFF_OUTPUT"
		fi
	fi
done

