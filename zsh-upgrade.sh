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
