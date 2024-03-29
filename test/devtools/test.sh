#!/bin/bash
set -e

source dev-container-features-test-lib

check "vi is installed" vim --version
check "vim is installed" vim --version
check "amix/vimrc is installed" test -d "/home/vscode/.vim_runtime/"
check ".vimrc is installed" test -f "/home/vscode/.vimrc"
check "amix/vimrc path" grep 'set runtimepath+=/home/vscode/.vim_runtime' /home/vscode/.vimrc
check "diff-so-fancy is installed" test -d "/usr/local/diff-so-fancy/"
check "diff-so-fancy is on the path" test -L "/usr/local/bin/diff-so-fancy"
check "pure-prompt is installed" test -d "/usr/local/pure-prompt"
check "make is installed" make --version

dsf_version=$((diff-so-fancy --version || true) 2>&1)
echo $dsf_version

reportResults