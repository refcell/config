/usr/bin/tmux new-session -d -s ENTER
/usr/bin/tmux detach -s ENTER
sleep 3
/usr/bin/tmux send-keys -t 0 "helios" ENTER
echo "$(date) ${1} RESTARTED HELIOS"
