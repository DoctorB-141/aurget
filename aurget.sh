#!/bin/bash
function aurget(){
	rm ~/funcplusplus/shellstuff/input.txt 
	touch ~/funcplusplus/shellstuff/input.txt
	curl https://aur.archlinux.org/packages/$1 > ~/funcplusplus/shellstuff/input.txt
	line=$(grep "(read-only, click to copy)" ~/funcplusplus/shellstuff/input.txt)
	num=30+${#1}
	echo $num
	url=${line:26:num}
	echo $url
	cd ~/programs
	git clone $url
	cd $1
	makepkg -si
}
