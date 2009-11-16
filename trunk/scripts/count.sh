for cmd in sed grep cat find telnet init exit ; do echo -n $cmd= ; grep -c "^$cmd " ~/.bash_history; done
