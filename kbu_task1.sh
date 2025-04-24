#!/bin/bash
set -e  # 중간에 실패하면 즉시 종료

# 필수 패키지 설치
apt-get update
apt-get install -y make build-essential curl git zlib1g-dev \
  libssl-dev libbz2-dev libreadline-dev libsqlite3-dev wget \
  llvm libncursesw5-dev xz-utils tk-dev libxml2-dev \
  libxmlsec1-dev libffi-dev liblzma-dev ca-certificates

# pyenv 설치
export PYENV_ROOT="/root/.pyenv"
git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT

# 환경 변수 설정
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Python 설치
pyenv install 3.12.0 -s

# 전역 설정
pyenv global 3.12.0

# 확인
pyenv -v
python --version
