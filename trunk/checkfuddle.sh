#!/bin/sh

FUDDLE=$HOME/fuddle

for FILE in .bashrc .vimrc .vimperatorrc
do
	diff -q $HOME/$FILE $FUDDLE/$FILE
	if [ $? ]; then
		cp $HOME/$FILE $FUDDLE/$FILE
	fi	
done	

cd $FUDDLE
svnadd
svncmit
