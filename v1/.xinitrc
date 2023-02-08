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

# If /etc/X11/xinit/xinitrc.d/ exists and is a directory
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    # For each file in ending in .sh
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        # Check if the file is executable, if so source it
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Start Gnome's Polkit Authentication Agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Start udisks2 front-end
udiskie --tray &

# Start i3-gaps (Window Manager)
exec i3
