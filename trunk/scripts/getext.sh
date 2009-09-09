#!/bin/sh
where=$HOME/kindle
for f in `ls`
do
	filename=$f
	ext=${filename##*.}
	if [ $ext = "tar" ]; then
		echo $filename
		tar xf $filename -C $where
	elif [ $ext = "gz" ]; then
		echo $filename
		tar zxf $filename -C $where
	elif [ $ext = "bz2" ]; then
		echo $filename
		tar jxf $filename -C $where
	fi
done
