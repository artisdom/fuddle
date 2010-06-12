#===================start of my .bashrc=====================#
#if [ -f ~/.bash_aliases ]; then
#    source ~/.bash_aliases
#fi	

#================start of my .bash_aliases==================#

if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH
fi

if [ -d /opt/google/chrome ]; then
	export PATH=/opt/google/chrome:$PATH
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
alias grep='grep --color=auto --exclude-dir=.git --exclude-dir=.svn'
alias mydate='date "+%Y-%m-%d %H:%M:%S"'

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

alias cpgl="cp ~/my_stuff/GetLatestVimScripts.dat ~/.vim/GetLatest/"
alias fixqbuf="sed -i 's/F4/F12/' ~/.vim/plugin/qbuf.vim"

ANDROID_SDK_PATH=~/android-sdk-linux_86
if [ -d ${ANDROID_SDK_PATH} ]; then
	export PATH=${ANDROID_SDK_PATH}/platforms/android-1.5/tools:${ANDROID_SDK_PATH}/tools:$PATH
fi

# ANDROID_NDK_PATH=~/android-ndk-1.6_r1
# if [ -d ${ANDROID_SDK_PATH} ]; then
#     export PATH=${ANDROID_NDK_PATH}/build/prebuilt/linux-x86/arm-eabi-4.2.1/bin:$PATH
# fi

alias emu15='emulator @android-1.5&'
alias emu16='emulator @android-1.6&'
alias emu20='emulator @android-2.0&'
alias emu201='emulator @android-2.0.1&'
alias emu21='emulator @android-2.1&'

alias ads='adb shell'
alias adk='adb kill-server'
alias add='adb devices'
alias adl='adb logcat'
alias adu='adb uninstall com.cidana.jplayer'
alias gvim='LANG="zh_CN.UTF-8" LOCALE="zh_CN.UTF-8" gvim'


#================end of my .bash_aliases==================#
