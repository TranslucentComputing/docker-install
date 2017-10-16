echo "=============================TC-INC DOCKER INSTALLATION==============================="
echo "CentOS - Docker Engine & Compose installation"
echo "======================================================================================"
echo "=> Installing docker-engine ..."
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
echo "=> Done!"

echo "=> Add tcinc to docker group"
sudo usermod -aG docker tcinc

echo "=> Installing docker-compose ..."
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "=> Done!"

echo "=> Add docker compose bash completion"
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/1.16.1/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
echo "=> Done!"

echo "======================================================================================"
echo "UPDATE Config before starting docker!!"
echo "======================================================================================"
