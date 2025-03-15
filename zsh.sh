#!/bin/bash

# 檢查是否已安裝 Zsh
if ! command -v zsh &> /dev/null
then
  echo "Zsh is not installed. Installing now..."
  # 根據您的作業系統，使用適當的套件管理器安裝 Zsh
  # 例如：
  # Debian/Ubuntu:
  sudo apt update
  sudo apt install -y zsh

  # Fedora/CentOS/RHEL:
  # sudo dnf install -y zsh

  # macOS (使用 Homebrew):
  # brew install zsh
else
  echo "Zsh is already installed."
fi

# 安裝 Oh My Zsh
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Oh My Zsh is not installed. Installing now..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi
