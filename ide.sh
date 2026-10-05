#!/bin/bash
cd ~
SESSION="dev"
unset TMUX

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $SESSION
  tmux split-window -h -p 30
  tmux send-keys -t $SESSION:0.0 'vim +Explore ; clear' C-m
  tmux send-keys -t $SESSION:0.1 'clear' C-m
fi

tmux attach-session -t $SESSION
