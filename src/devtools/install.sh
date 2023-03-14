#!/bin/sh
set -e

USERNAME=${USERNAME:-vscode}
VIMRC_PATH=${VIMRC_PATH:-/home/vscode/.vimrc}
AMIX_VIMRC_PATH=${AMIX_VIMRC_PATH:-/usr/local/vim_runtime}
AMIX_VIMRC_VERSION=${AMIX_VIMRC_VERSION:-master}
DSF_PATH=${DSF_PATH:-/usr/local/diff-so-fancy}
DSF_VERSION=${DSF_VERSION:-master}

apt-get update
# Install git if not already installed
if ! type git > /dev/null 2>&1; then
  apt-get -y install --no-install-recommends git ca-certificates
fi
apt-get remove -y vim-tiny
apt-get install -y --no-install-recommends vim make
apt-get clean
rm -rf /var/lib/apt/lists/*

rm -rf "${AMIX_VIMRC_PATH}"
git clone https://github.com/amix/vimrc.git "${AMIX_VIMRC_PATH}"
cd "${AMIX_VIMRC_PATH}"
git checkout -b tmp "${AMIX_VIMRC_VERSION}"
rm -rf .git

rm -rf "${VIMRC_PATH}"
cat > "${VIMRC_PATH}" \
<< EOF
" DO NOT EDIT THIS FILE
" Add your own customizations in ${AMIX_VIMRC_PATH}/my_configs.vim
set runtimepath+=${AMIX_VIMRC_PATH}
source ${AMIX_VIMRC_PATH}/vimrcs/basic.vim
source ${AMIX_VIMRC_PATH}/vimrcs/filetypes.vim
source ${AMIX_VIMRC_PATH}/vimrcs/plugins_config.vim
source ${AMIX_VIMRC_PATH}/vimrcs/extended.vim
try
  source ${AMIX_VIMRC_PATH}/my_configs.vim
catch
endtry
EOF

if id "${USERNAME}" >/dev/null 2>&1; then
  chown -R "${USERNAME}:${USERNAME}" "${AMIX_VIMRC_PATH}"
  chown "${USERNAME}:${USERNAME}" "${VIMRC_PATH}"
fi

rm -rf "${DSF_PATH}"
git clone https://github.com/so-fancy/diff-so-fancy.git "${DSF_PATH}"
cd "${DSF_PATH}"
git checkout -b tmp "${DSF_VERSION}"
rm -rf .git
ln -sf "${DSF_PATH}/diff-so-fancy" /usr/local/bin/diff-so-fancy

rm -rf "${PURE_PATH}"
git clone https://github.com/sindresorhus/pure.git "${PURE_PATH}"
cd "${PURE_PATH}"
git checkout -b tmp "${PURE_VERSION}"
rm -rf .git
