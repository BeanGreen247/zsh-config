# check if current tty is 1 then run i3 with startx
if [ "$(tty)" = "/dev/tty1" ]; then
	startx
fi
