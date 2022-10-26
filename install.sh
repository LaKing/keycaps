#!/bin/bash

## for fedora or rpn distros
sudo dnf -y install evtest

if [[ -f $PWD/keycap.sh ]]
then

    ## the service will be in the userspace
    mkdir -p $HOME/.local/share/systemd/user

    cat > "$HOME/.local/share/systemd/user/keycaps.service" << EOF
[Unit]
Description=Capture keyboard events, and start programms accordingly
[Service]
Type=simple
TimeoutStartSec=0
ExecStart=/bin/bash $PWD/keycap.sh
[Install]
WantedBy=default.target
EOF

    ## restart the service and print some info's
    systemctl --user enable keycaps.service
    systemctl --user restart keycaps.service
    sleep 1
    echo "systemctl --user status keycaps.service"
    systemctl --user status keycaps.service
    sleep 1
else
    echo "keycap.sh is not in the current directory"
fi