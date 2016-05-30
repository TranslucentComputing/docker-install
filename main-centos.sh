echo "=============================TC-INC DOCKER INSTALLATION==============================="
echo "CentOS - Docker Engine & Compose installation"
echo "======================================================================================"
echo "=> Installing docker-engine ..."
curl -fsSL https://get.docker.com/ | sh > /dev/null 2>&1
echo "=> Starting docker-engine ..."
sudo service docker start> /dev/null 2>&1
echo "=> Done!"
echo "=> Ensuring Docker starts when you boot your system, ..."
sudo chkconfig docker on
echo "=> Done!"
echo "=> Installing docker-compose ..."
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` >/usr/local/bin/docker-compose 2>/dev/null"
sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1
echo "=> Done!"
echo "=> Add docker compose bash completion"
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
echo "=> Done!"
echo "======================================================================================"
echo "The latest versions of Docker Engine and Docker Compose has installed and configured:"
echo ""
docker --version
echo ""
docker-compose --version
echo ""
service docker status
echo ""
echo "======================================================================================"