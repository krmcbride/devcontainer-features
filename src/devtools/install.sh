#!/bin/sh
set -e

AMIX_VIMRC_PATH=${AMIX_VIMRC_PATH:-/usr/local/vim_runtime}
AMIX_VIMRC_VERSION=${AMIX_VIMRC_VERSION:-master}
DSF_PATH=${DSF_PATH:-/usr/local/diff-so-fancy}
DSF_VERSION=${DSF_VERSION:-master}

apt-get update
apt-get install -y --no-install-recommends vim
apt-get clean
rm -rf /var/lib/apt/lists/*

git clone https://github.com/amix/vimrc.git "${AMIX_VIMRC_PATH}"
cd "${AMIX_VIMRC_PATH}"
git checkout -b tmp "${AMIX_VIMRC_VERSION}"
rm -rf .git

cat > /root/.vimrc \
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

git clone https://github.com/so-fancy/diff-so-fancy.git "${DSF_PATH}"
cd "${DSF_PATH}"
git checkout -b tmp "${DSF_VERSION}"
rm -rf .git
ln -s "${DSF_PATH}/diff-so-fancy" /usr/local/bin/diff-so-fancy