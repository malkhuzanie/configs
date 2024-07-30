#!/usr/bin/bash

CONFIG=$([ "$2" = "" ] && echo "mhd_android" || echo "$2")

case $1 in
start)
    echo "starting openvpn client"
    echo malkhuzanie | sudo -S systemctl start openvpn-client@$CONFIG
    ;;
stop)
    echo "stoping openvpn clinet"
    echo malkhuzanie | sudo -S systemctl stop openvpn-client@$CONFIG
    ;;
restart | reload)
    echo "restarting openvpn client"
    echo malkhuzanie | sudo -S systemctl restart openvpn-client@$CONFIG
    ;;
status)
    systemctl status openvpn-client@$CONFIG
    ;;
*)
    echo "you must run this script with start, stop, or restart"

esac
