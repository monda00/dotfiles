#!/bin/bash

echo "install apps..."

# homebrew (https://brew.sh/)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# git
brew install git

# Nerd Font

# ===========================
# command line
# ===========================
# bat (https://github.com/sharkdp/bat)
brew install bat
brew install eth-p/software/bat-extras

# lsd (https://github.com/lsd-rs/lsd)
brew install lsd

# tree
brew install tree

# ===========================
# wireshark
# ===========================
brew install wireshark --cask

# ===========================
# java
# ===========================
# cask-versions (https://github.com/Homebrew/homebrew-cask-versions)
brew tap homebrew/cask-versions
# jenv (https://github.com/jenv/jenv)
brew install jenv
jenv enable-plugin export
exec $SHELL -l

# ===========================
# Node.js
# ===========================
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# ===========================
# Python
# ===========================

# ===========================
# Go
# ===========================

# ===========================
# Ruby
# ===========================
brew install rbenv ruby-build
rbenv install 3.2.2
rbenv global 3.2.2

# ===========================
# neovim
# ===========================
brew install neovim
# astonvim (https://github.com/AstroNvim/AstroNvim)
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# ===========================
# k8s
# ===========================
brew install kubectl
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
kubectl krew install iexec
kubectl krew install images
kubectl krew install pod-inspect
kubectl krew install resource-capacity
kubectl krew install status
kubectl krew install view-allocations
# k9s (https://github.com/derailed/k9s)
brew install derailed/k9s/k9s
# kubeswitch (https://github.com/danielfoehrKn/kubeswitch)
brew install danielfoehrkn/switch/switch
# stern (https://github.com/stern/stern)
brew install stern
# minikube (https://minikube.sigs.k8s.io/docs/start/)
brew install minkube
# Istio
brew install istioctl

# ===========================
# Helm
# ===========================
brew install helm
helm plugin install https://github.com/databus23/helm-diff
# helmfile (https://github.com/roboll/helmfile)
brew install helmfile

# ===========================
# Buildpack
# ===========================
brew install buildpacks/tap/pack

# ===========================
# tmux
# ===========================
# tmux (https://github.com/tmux/tmux)
brew install tmux
# tpm (https://github.com/tmux-plugins/tpm)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# tmuxinator (https://github.com/tmuxinator/tmuxinator)
gem install tmuxinator

echo "install finished!"