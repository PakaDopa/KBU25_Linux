#!/bin/bash
set -e

# 필수 패키지 설치
apt-get update
apt-get install -y make build-essential curl git zlib1g-dev \
  libssl-dev libbz2-dev libreadline-dev libsqlite3-dev wget \
  llvm libncursesw5-dev xz-utils tk-dev libxml2-dev \
  libxmlsec1-dev libffi-dev liblzma-dev ca-certificates

# pyenv 설치
export PYENV_ROOT="/root/.pyenv"
git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT

# pyenv 환경 변수 및 초기화 - .bashrc에 추가
# echo 'export PYENV_ROOT="/root/.pyenv"' >> /root/.bashrc
# echo 'export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"' >> /root/.bashrc
# echo 'eval "$(pyenv init --path)"' >> /root/.bashrc
# echo 'eval "$(pyenv init -)"' >> /root/.bashrc

# 현재 셸에서도 반영
# export PATH="/root/.pyenv/bin:/root/.pyenv/shims:$PATH"
# eval "$(/root/.pyenv/bin/pyenv init --path)"
# eval "$(/root/.pyenv/bin/pyenv init -)"

# Python 설치
pyenv install 3.12.0 -s
pyenv global 3.12.0

# 확인
pyenv -v
python --version

