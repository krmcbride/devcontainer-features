#!/bin/bash
set -e

source dev-container-features-test-lib

check "zsh is installed" zsh --version
check "oh-my-zsh is installed" test -d "/usr/local/oh-my-zsh/"
check "omz custom aliases" grep 'alias gcaa' /usr/local/oh-my-zsh/custom/aliases.zsh
check "pure-prompt is installed" test -d "/usr/local/pure-prompt/"
check ".zshrc is installed" test -f "/root/.zshrc"
check ".zshrc omz path" grep 'source /usr/local/oh-my-zsh/oh-my-zsh.sh' /root/.zshrc
check ".zshrc pure path" grep 'fpath+=(/usr/local/pure-prompt)' /root/.zshrc

reportResults