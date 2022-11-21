#!/bin/bash
set -e

source dev-container-features-test-lib

check "zsh is installed" zsh --version
check "oh-my-zsh is installed" test -d "/root/.oh-my-zsh/"
check "omz custom aliases" grep 'alias gcaa' /root/.oh-my-zsh/custom/aliases.zsh
check ".zshrc is installed" test -f "/root/.zshrc"
# check "pure-prompt is installed" test -d "/usr/local/pure-prompt/"
# check ".zshrc pure path" grep 'fpath+=(/usr/local/pure-prompt)' /root/.zshrc

reportResults
