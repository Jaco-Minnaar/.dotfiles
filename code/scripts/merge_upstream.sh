#!/bin/sh -e

if [ -z $1 ]; then
    echo "No path given"
    exit 1
fi

if [ -z $2 ]; then
    TARGET="main"
else
    TARGET=$2
fi

WORKING_DIRECTORY=$1

BRANCH=$(git branch --show-current)

if [ "$(git stash)" = "No local changes to save" ]; then
    STASHED=0
else
    STASHED=1
    echo "Local changes stashed"
fi

if [ $TARGET != $BRANCH ]; then
    git checkout "${TARGET}"
fi

UPSTREAM="upstream/${TARGET}"

git fetch upstream
git merge "${UPSTREAM}"

if [ $TARGET != $BRANCH ]; then
    git checkout "${BRANCH}"
fi

if [ $STASHED -eq 1 ]; then
    git stash pop
fi
