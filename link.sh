echo "setup symbolic link..."

ln -sf ~/dotfiles/shell/zsh/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/shell/zsh/zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/shell/zsh/.kubectl_aliases ~/.kubectl_aliases
ln -sf ~/dotfiles/astronvim ~/.config/nvim/lua/user
ln -sf ~/dotfiles/kubeswitch/switch.alias ~/.kube/switch-state/switch.alias
ln -sf ~/dotfiles/tmux/tmuxinator ~/.tmuxinator

mkdir -p ~/.config/k9s
ln -sf ~/dotfiles/k9s/config.yml ~/.config/k9s/config.yml

mkdir -p ~/.config/bat
ln -sf ~/dotfiles/bat.conf ~/.config/bat/config

source ~/.zshrc
tmux source ~/.tmux.conf

jenv enable-plugin export
exec $SHELL -l

echo "finish symbolic link!!"