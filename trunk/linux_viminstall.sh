if [ -z $1 ]; then
	echo "installed in $HOME"
	cp .vimrc $HOME/.vimrc -f
	cp .vim $HOME -rf
else
	echo installed in $1
	cp .vimrc $1/.vimrc -f
	cp .vim $1 -rf
fi


