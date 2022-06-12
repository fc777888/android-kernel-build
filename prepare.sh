#!/usr/bin/env bash

# https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/github-debian.sh#L184
# https://github.com/cli/cli/issues/4634

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update && sudo apt-get install -y git curl wget sudo apt-utils tzdata

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo chmod 644 /usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod 644 /etc/apt/sources.list.d/github-cli.list

sudo apt-get update && sudo apt-get install gh -y
