#!/bin/bash
set -e

# 필요한 의존성 설치 (리눅스 예시)
sudo apt-get update
sudo apt-get install make gcc ncurses-dev -y

# pyenv 설치 스크립트 다운로드
wget -O install.sh https://github.com/pyenv/pyenv-installer/raw/master/install.sh

# pyenv 설치 스크립트 실행
bash install.sh

# pyenv 경로 추가 (예시)
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PYENV_VERSION="2.3.19"' >> ~/.bashrc
echo 'export PYENV_ROOT_OLD="$HOME/.pyenv"' >> ~/.bashrc
echo 'eval "$(pyenv init bash)"' >> ~/.bashrc

# 설정 적용
source ~/.bashrc

# Python 설치
pyenv install 3.12.0 -s
pyenv global 3.12.0

# 설치 확인 (채점기에서 따로 하겠지만 여기도 출력)
pyenv -v
python --version
