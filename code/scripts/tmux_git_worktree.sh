#!/bin/sh -e

# This script is used to create a new tmux session for a git worktree

WORKDIR=$(git worktree list | grep -v '.bare' | sed 's/ .*//g' | fzf-tmux)
NAME=$(basename $WORKDIR)

if [ -z "$WORKDIR" ]; then
    echo "Could not determine worktree"
    exit 0
fi

if [ -z "$NAME" ]; then
    echo "Could not determine name of worktree"
    exit 0
fi

launch_new_session() {
    COMMAND=$1
    echo "Launching new session ${NAME} in ${WORKDIR} with command ${COMMAND}"
    tmux new-session -d -s ${NAME} -c ${WORKDIR} \; $COMMAND -t ${NAME} \; send-keys "lazygit" C-m \; rename-window "lazygit" \; new-window -n "editor" "nvim" \; new-window -n "shell" "zsh" \; select-window -t 1 
}

if [ -z "$TMUX" ]; then
    SWITCH_COMMAND="attach-session"
else 
    SWITCH_COMMAND="switch"
fi

if $(tmux has-session -t ${NAME} 2>/dev/null); then
    echo "Session ${NAME} already exists. Switching to it."
    tmux $SWITCH_COMMAND -t ${NAME}
    exit 0
fi 

echo "Session ${NAME} does not exist. Creating it."

launch_new_session $SWITCH_COMMAND


