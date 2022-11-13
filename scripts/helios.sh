#! /bin/bash

tmux kill-server  > /dev/null 2>&1
tmux new-session -d -s "helios" &
sleep 2
tmux send-keys -t 0 "helios" ENTER
echo "$(date) ${1} RESTARTED HELIOS"
