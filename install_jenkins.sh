#!/bin/bash

echo "Install Dependencies"
yum -y update
yum remove -y java
yum install -y java-11-openjdk
yum install -y maven 
yum install -y git
yum install -y docker
yum install -y yum-utils

echo "Install Jenkins"
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install -y jenkins
usermod -a -G docker jenkins

echo "Install terraform"
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform
terraform -install-autocomplete

echo "Enable systemd services"
systemctl enable jenkins
systemctl start jenkins
systemctl enable docker
systemctl start docker