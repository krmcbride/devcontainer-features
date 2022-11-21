#!/bin/bash
set -e

source dev-container-features-test-lib

check "vim is installed" vim --version
check "amix/vimrc is installed" test -d "/usr/local/vim_runtime/"
check ".vimrc is installed" test -f "/root/.vimrc"
check "amix/vimrc path" grep 'set runtimepath+=/usr/local/vim_runtime' /root/.vimrc

reportResults