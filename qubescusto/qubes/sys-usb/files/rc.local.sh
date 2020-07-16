#!/bin/sh

# This script will be executed at every VM startup, you can place your own
# custom commands here. This include overriding some configuration in /etc,
# starting services etc.

# Cleaning up previous remote adb usage in case it has been forgotten
/usr/bin/qrexec-client-vm dom0 dev.phone.StopRemoteADB

# udev rules
for rules in /rw/config/udev/*; do
    [ -e "${rules}" ] || continue;
    ln -s "${rules}" "/etc/udev/rules.d"
done
udevadm control --reload
