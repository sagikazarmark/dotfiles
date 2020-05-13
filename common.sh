#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

$DIR/asdf.sh

# Link .warprc
ln -sf $DIR/.warprc $HOME/.warprc

# Link git configs
ln -sf $DIR/.gitconfig $HOME/.gitconfig
ln -sf $DIR/gitignore $HOME/.gitignore

# Krew
curl https://krew.sh/ | bash
kubectl krew install ctx
kubectl krew install konfig
kubectl krew install ns
kubectl krew install view-secret
