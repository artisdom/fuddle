#========================================#
if [ -d $HOME/bin ]; then
export PATH=$HOME/bin:$PATH
fi

ANDROID_SDK_PATH=$HOME/android-sdk-linux_x86-1.5_r3
if [ -d ${ANDROID_SDK_PATH} ]; then
export PATH=${ANDROID_SDK_PATH}/tools:$PATH
fi

export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;43;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

alias agi='sudo apt-get install'
alias ag='sudo apt-get'
alias acs='apt-cache search'
alias ac='apt-cache'

alias gdb='gdb -silent'
alias la='ls -A'
alias ll='ls -l'
alias le='less'
alias gpmstart='sudo gpm -m /dev/misc/psaus -t ps2'
alias checkoutfuddle='svn checkout https://fuddle.googlecode.com/svn/trunk/ fuddle --username physaris --password xE8Mq4XY6tX2'

alias svnmodi="svn status | grep '^ \?' | awk '{print $2}'"
alias svnadd="svn status | grep '^ \??' | awk '{print $2}' |xargs svn add"
alias svncmit="svn commit -m ' '"
alias cm="./configure && make"
