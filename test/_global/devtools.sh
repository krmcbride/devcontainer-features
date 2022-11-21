#!/bin/bash
set -e

source dev-container-features-test-lib

check "zsh is installed" zsh --version
check "vi is installed" vim --version
check "vim is installed" vim --version

reportResults
