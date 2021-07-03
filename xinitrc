#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Turn off DPMS
xset s off -dpms
# start function key mapper
xbindkeys &
# set brightness
xrandr --output eDP-1 --brightness 0.7
# turn off touch screen
xinput disable `xinput | grep 'Touch Screen' | awk '{ print $8 }' | grep 'id=' | sed 's/id=//'`
#xinput disable 13

# start statusbar
/usr/local/bin/dwmblocks &
# lang switch on alt-shift
setxkbmap -model pc104 -layout us,ru -variant ,, -option grp:alt_shift_toggle
# start compositor
picom --config ~/.config/picom/picom.conf -b
# set wallpaper
$HOME/scripts/pscircle.sh &
#feh --bg-scale ~/Pictures/spacecraft.jpg
# start dwm
exec dwm
