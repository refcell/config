#! /bin/bash

tmux kill-server  > /dev/null 2>&1
tmux new-session -d -s "helios" &
sleep 10
tmux send-keys -t 0 "helios --execution-rpc \$ETH_RPC_URL" ENTER
echo "$(date) ${1} RESTARTED HELIOS"
