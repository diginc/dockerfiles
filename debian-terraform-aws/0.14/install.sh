#!/usr/bin/env bash
set -ex
cd /tmp/

# AWS v2
curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install
aws --version

# Terraform latest 0.12 verison for modules that do not yet support 0.13+
latest_version='v0.14.0'
latest_version="${latest_version/v/}" # strip the v/version from front

curl -s "https://releases.hashicorp.com/terraform/${latest_version}/terraform_${latest_version}_linux_amd64.zip" -o terraform.zip
unzip terraform.zip -d /bin/

# tflint https://github.com/terraform-linters/tflint
curl -L "$(curl -Ls https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip
unzip tflint.zip
install tflint /usr/local/bin
tflint -v
rm tflint.zip
