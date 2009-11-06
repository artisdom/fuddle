#!/bin/sh

FUDDLE=$HOME/hostshare/fuddle

for FILE in .bashrc .vimrc .vimperatorrc
do
	diff $HOME/$FILE $FUDDLE/$FILE
#    diff -q $HOME/$FILE $FUDDLE/$FILE
#    if [ $? ]; then
#        cp $HOME/$FILE $FUDDLE/$FILE
#    fi	
done	

#cd $FUDDLE
#svnadd
#svncmit
