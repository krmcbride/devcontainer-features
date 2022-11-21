#!/bin/sh
set -e

OMZ_PATH=${OMZ_PATH:-/usr/local/oh-my-zsh}
OMZ_VERSION=${OMZ_VERSION:-master}
PURE_PATH=${PURE_PATH:-/usr/local/pure-prompt}
PURE_VERSION=${PURE_VERSION:-master}

cd /root

echo "Installing git, zsh and oh-my-zsh version ${OMZ_VERSION}"

apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  git \
  zsh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* /var/tmp/*


git clone https://github.com/robbyrussell/oh-my-zsh.git "${OMZ_PATH}" \
  && ( \
  cd "${OMZ_PATH}" \
  && git checkout -b tmp "${OMZ_VERSION}" \
  && rm -rf .git \
  )

git clone https://github.com/sindresorhus/pure.git "${PURE_PATH}" \
  && ( \
  cd "${PURE_PATH}" \
  && git checkout -b tmp "${PURE_VERSION}" \
  && rm -rf .git \
  )

cat > /root/.zshrc \
<< EOF
# Using pure prompt https://github.com/sindresorhus/pure#oh-my-zsh
ZSH_THEME=""
plugins=(git gh z python pyenv pipenv poetry docker docker-compose terraform aws gcloud kubectl)
source ${OMZ_PATH}/oh-my-zsh.sh

# https://github.com/sindresorhus/pure#manually
# https://github.com/sindresorhus/pure#oh-my-zsh
# https://github.com/sindresorhus/pure#getting-started
fpath+=(${PURE_PATH})
autoload -U promptinit; promptinit
prompt pure
EOF

cat > ${OMZ_PATH}/custom/aliases.zsh \
<< EOF
# shell
alias c='clear'
alias l='ls -hl'
alias all='l -A'
alias ll='l -A'
# Git
alias g='git'
alias ga='git add'
alias gall='git add -A'
alias gd='git diff'
alias gl='git log -10'
alias gs='git status'
alias gss='git status -s'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
alias gcaa="git commit -a --amend -C HEAD"
EOF