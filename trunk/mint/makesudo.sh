#!/bin/sh
SUDOFILE=/etc/sudoers
sed -i 's/^%admin/#%admin/' $SUOFILE
echo "%admin ALL=NOPASSWD: ALL" >> $SUDOFILE
