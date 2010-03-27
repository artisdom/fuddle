vi -c 'so %' $HOME/my_stuff/getscript.vba
tar zxvf $HOME/my_stuff/vimball.tar.gz -C $HOME/.vim
cp $HOME/my_stuff/GetLatestVimScripts.dat $HOME/.vim/GetLatest/
vi
#input GLVS to get lastest vim scripts
cp -r $HOME/.vim/EnhancedCommentify-2.3/* $HOME/.vim/
rm -r $HOME/.vim/EnhancedCommentify-2.3
sed -i 's/F4/F12/' $HOME/.vim/plugin/qbuf.vim
