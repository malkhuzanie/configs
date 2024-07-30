#!/usr/bin/bash

CONFIG=$([ "$2" = "" ] && echo "wg" || echo "$2")

case $1 in 
  start)
    echo "starting wireguard with config $CONFIG"
    echo malkhuzanie | sudo -S wg-quick up $CONFIG
    ;;
  stop)
    echo "stoping wireguard with config $CONFIG"
    echo malkhuzanie | sudo -S wg-quick down $CONFIG
    ;;
  restart)
    echo "stoping wireguard with config $CONFIG"
    echo malkhuzanie | sudo -S wg-quick down $CONFIG; wg-quick up $CONFIG;
    ;;
  *)
    echo "you must run this script with start, stop, or restart"
  esac

