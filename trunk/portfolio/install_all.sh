#!/bin/sh
# svn checkout https://fuddle.googlecode.com/svn/trunk/my_stuff --username physaris --password xE8Mq4XY6tX2

MY_STUFF_PATH=$HOME/my_stuff
ln -s $MY_STUFF_PATH/.bash_aliases $HOME
echo "ln -s $MY_STUFF_PATH/.bash_aliases $HOME"

ln -s $MY_STUFF_PATH/.vimrc $HOME
echo "ln -s $MY_STUFF_PATH/.vimrc $HOME"

mkdir -p $HOME/.vim/GetLatest
echo "mkdir -p $HOME/.vim/GetLatest"

cp GetLatestVimScripts.dat $HOME/.vim/GetLatest 
echo "cp GetLatestVimScripts.dat $HOME/.vim/GetLatest"

tar zxvf vimball.tar.gz -C $HOME/.vim

# sed -i 's/F4/F12/' .vim/plugin/qbuf.vim

