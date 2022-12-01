#!/usr/bin/env zsh
set -e

local target=$HOME/.zsh/zaw/sources
if [[ -n $1 ]]; then
  target=$1
fi

mkdir -p "$target"

for file in sources/*.zsh
do
  ln -sf "$PWD/$file" $target
done
