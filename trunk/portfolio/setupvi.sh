localpath=`pwd`
vi -c 'so %' $localpath/getscript.vba
tar zxvf $localpath/vimball.tar.gz -C ~/.vim
cp $localpath/GetLatestVimScripts.dat ~/.vim/GetLatest/
vi
#input GLVS to get lastest vim scripts
cp -r ~/.vim/EnhancedCommentify-2.3/* ~/.vim/
rm -r ~/.vim/EnhancedCommentify-2.3
sed -i 's/F4/F12/' ~/.vim/plugin/qbuf.vim
