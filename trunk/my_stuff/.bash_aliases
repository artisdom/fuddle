#===================start of my .bashrc=====================#
#if [ -f $HOME/.bash_aliases ]; then
#    source $HOME/.bash_aliases
#fi	

#================start of my .bash_aliases==================#

if [ -d $HOME/bin ]; then
	export PATH=$HOME/bin:$PATH
fi

export EDITOR=vi
export LESS_TERMCAP_mb=$'\E[01;36m'
export LESS_TERMCAP_md=$'\E[01;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;43;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'

alias agi='sudo apt-get install'
alias ag='sudo apt-get'
alias acs='apt-cache search'
alias ac='apt-cache'

alias ls='ls --color -F'
alias la='ls -A'
alias ll='ls -l'
alias le='less'
alias grep='grep --exclude-dir=.git --exclude-dir=.svn'

alias gpmstart='sudo gpm -m /dev/misc/psaus -t ps2'

alias svnmodi="svn status | grep '^ \?' | awk '{print $2}'"
alias svnadd="svn status | grep '^ \??' | awk '{print $2}' |xargs svn add"
alias svncmit="svn commit -m ' '"

alias gdb='gdb -silent -tui'
alias cm="./configure && make"
alias cmi="./configure && make && sudo make install"
alias mcm='make clean && make'
alias vial='vi ~/.bash_aliases'
alias gvi='gvim'
alias si='wine /home/cidana/.wine/drive_c/Program\ Files/Source\ Insight\ 3/Insight3.exe & '

alias s="sdcv"

alias cpgl="cp $HOME/my_stuff/GetLatestVimScripts.dat $HOME/.vim/GetLatest/"
alias fixqbuf="sed -i 's/F4/F12/' $HOME/.vim/plugin/qbuf.vim"

ANDROID_SDK_PATH=$HOME/android-sdk-linux
if [ -d ${ANDROID_SDK_PATH} ]; then
	export PATH=${ANDROID_SDK_PATH}/platforms/android-1.5/tools:${ANDROID_SDK_PATH}/tools:$PATH
fi

# ANDROID_NDK_PATH=$HOME/android-ndk-1.6_r1
# if [ -d ${ANDROID_SDK_PATH} ]; then
#     export PATH=${ANDROID_NDK_PATH}/build/prebuilt/linux-x86/arm-eabi-4.2.1/bin:$PATH
# fi

alias emu15='emulator @android-1.5&'
alias emu16='emulator @android-1.6&'
alias emu20='emulator @android-2.0&'

alias adp='adb pull /data/app/com.cidana.jplayer.apk .'
alias ads='adb shell'
alias adi='adb install'
alias adk='adb kill-server'
alias add='adb devices'
alias adu='adb uninstall com.cidana.jplayer'
alias sadd='sudo /home/cidana/android-sdk-linux/tools/adb devices'
alias gitone='git init && git add . && git commit -m "initial commit"'


#================end of my .bash_aliases==================#
