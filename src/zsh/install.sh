#!/bin/sh
set -e

OMZ_PATH=${OMZ_PATH:-/usr/local/oh-my-zsh}
OMZ_VERSION=${OMZ_VERSION:-master}
PURE_PATH=${PURE_PATH:-/usr/local/pure-prompt}
PURE_VERSION=${PURE_VERSION:-master}

echo "Installing git, zsh and oh-my-zsh version ${OMZ_VERSION}"

apt-get update && apt-get install -y --no-install-recommends \
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