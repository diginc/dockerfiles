#!/usr/bin/env bash
set -ex
cd /tmp/

# AWS v2
curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install
aws --version

# Terraform
latest_version=''
if ! latest_version=$(curl -sI https://github.com/hashicorp/terraform/releases/latest | grep --color=never -i Location | awk -F / '{print $NF}' | tr -d '[:cntrl:]'); then
    print "Failed to retrieve latest docker-pi-hole release metadata"
else
    latest_version="${latest_version/v/}" # strip the v/version from front
fi

curl -s "https://releases.hashicorp.com/terraform/${latest_version}/terraform_${latest_version}_linux_amd64.zip" -o terraform.zip
unzip terraform.zip -d /bin/
