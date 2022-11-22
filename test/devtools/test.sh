#!/bin/bash
set -e

source dev-container-features-test-lib

check "vi is installed" vim --version
check "vim is installed" vim --version
check "amix/vimrc is installed" test -d "/root/.vim_runtime/"
check ".vimrc is installed" test -f "/root/.vimrc"
check "amix/vimrc path" grep 'set runtimepath+=/root/.vim_runtime' /root/.vimrc
check "diff-so-fancy is installed" test -d "/usr/local/diff-so-fancy/"
check "diff-so-fancy is on the path" test -L "/usr/local/bin/diff-so-fancy"

reportResults