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

# pyenv 환경 설정을 /etc/profile.d에 등록 (모든 셸에서 적용되도록)
cat <<EOF > /etc/profile.d/pyenv.sh
export PYENV_ROOT="/root/.pyenv"
export PATH="\$PYENV_ROOT/bin:\$PYENV_ROOT/shims:\$PATH"
eval "\$(pyenv init --path)"
eval "\$(pyenv init -)"
EOF

# 현재 셸에서도 즉시 적용
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Python 설치
pyenv install 3.12.0 -s
pyenv global 3.12.0

# 설치 확인 (채점기에서 따로 하겠지만 여기도 출력)
pyenv -v
python --version
