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
sudo yum install -y epel-release
sudo pip install --upgrade pip
sudo yum install -y python-pip
sudo yum upgrade python*
sudo pip install backports.ssl_match_hostname --upgrade
sudo pip install docker-compose
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
