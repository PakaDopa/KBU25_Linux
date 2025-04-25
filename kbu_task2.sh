#!/bin/bash
set -e

# 필수 패키지 설치
apt-get update
apt-get install -y make build-essential curl git zlib1g-dev \
  libssl-dev libbz2-dev libreadline-dev libsqlite3-dev wget \
  llvm libncursesw5-dev xz-utils tk-dev libxml2-dev \
  libxmlsec1-dev libffi-dev liblzma-dev ca-certificates

# pyenv 설치
export PYENV_ROOT="$HOME/.pyenv"
git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"

# pyenv 환경변수 설정을 현재 사용자 환경파일에 추가
if [ -w "$HOME/.bashrc" ]; then
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$HOME/.bashrc"
  echo 'export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"' >> "$HOME/.bashrc"
  echo 'eval "$(pyenv init --path)"' >> "$HOME/.bashrc"
  echo 'eval "$(pyenv init -)"' >> "$HOME/.bashrc"
fi

# 현재 셸에서도 즉시 적용
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$("$PYENV_ROOT/bin/pyenv" init --path)"
eval "$("$PYENV_ROOT/bin/pyenv" init -)"

# Python 설치 및 전역 설정
pyenv install 3.12.0 -s
pyenv global 3.12.0

# pyenv 및 Python 버전 확인
pyenv -v
python --version
