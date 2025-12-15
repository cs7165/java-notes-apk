#!/bin/bash
set -e

echo "Updating system"
sudo apt update -y && sudo apt upgrade -y

echo "Installing Java 17"
sudo apt install -y openjdk-17-jdk

echo "Installing Maven"
sudo apt install -y maven

echo "Installing Docker"
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu

echo "Installing MySQL"
sudo apt install -y mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql

echo "Configuring MySQL"
sudo mysql <<EOF
CREATE DATABASE IF NOT EXISTS notesdb;
CREATE USER IF NOT EXISTS 'notesuser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON notesdb.* TO 'notesuser'@'%';
FLUSH PRIVILEGES;
EOF

echo "Installing Jenkins"
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install -y jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo usermod -aG docker jenkins

echo "Opening ports"
sudo ufw allow 22
sudo ufw allow 8080
sudo ufw allow 3306
sudo ufw --force enable

echo "Setup completed. Please reboot."
