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

# 將 Zsh 設為預設 shell
if [[ $SHELL != "/bin/zsh" ]]; then
  echo "Setting Zsh as the default shell..."
  chsh -s $(which zsh)
  echo "Please log out and log back in or restart your terminal for the changes to take effect."
else
  echo "Zsh is already the default shell."
fi

echo "Zsh Installation complete!"

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

cp ./.zshrc ~/.zshrc

source ~/.zshrc

p10k configure
