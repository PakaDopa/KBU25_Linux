#!/bin/bash

# 에러 발생 시 스크립트 종료
set -e

# pyenv 설치 (이미 설치되어 있다면 건너뜁니다.)
if ! command -v pyenv &> /dev/null
then
  curl https://pyenv.run | bash
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
  source ~/.bashrc
else
  echo "pyenv is already installed."
fi

# pyenv 초기화 (매번 실행하여 확실히 활성화)
eval "$(pyenv init - bash)"

# 필요한 패키지 설치 (apt update는 Dockerfile에서 이미 수행하므로 생략)
apt-get update
apt-get install -y --no-install-recommends \
  build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
  wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Python 3.12.0 설치 (이미 설치되어 있다면 건너뜁니다.)
if ! pyenv versions | grep "3.12.0"
then
  pyenv install 3.12.0
else
  echo "Python 3.12.0 is already installed."
fi

# 전역 파이썬 버전 설정
pyenv global 3.12.0

