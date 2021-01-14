#!/bin/zsh

set -e

# Pozor: make sure to run this after common install steps are done.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

function error {
  echo -e "\x1B[31m\\\$1\x1B[0m" >&2
  exit 1
}

# Install Krew
# See https://krew.sigs.k8s.io/docs/user-guide/setup/install/
(
  set -x; cd "$(mktemp -d)" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_$(uname -m | sed -e 's/x86_64/amd64/' -e 's/arm.*$/arm/')" &&
  "$KREW" install krew
)

kubectl krew > /dev/null || error "Failed to install krew"

kubectl krew install < $DIR/krew.txt


# Install asdf plugins
asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git
asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf plugin-add python
asdf plugin-add "argo|argo-cd" https://github.com/trnubo/asdf-argo.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add packer https://github.com/gozer/asdf-packer.git
asdf plugin-add yarn
asdf plugin-add hugo https://github.com/beardix/asdf-hugo.git
