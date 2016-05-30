echo "=============================TC-INC DOCKER INSTALLATION==============================="
echo "Docker Engine & Compose installation"
echo "======================================================================================"
echo ""
echo "=> Installing docker-engine ..."
curl -fsSL https://get.docker.com/ | sh > /dev/null 2>&1
echo "=> Starting docker-engine ..."
sudo service docker start> /dev/null 2>&1
echo "=> Done!"
echo "=> Ensuring Docker starts when you boot your system, ..."
sudo chkconfig docker on
echo "=> Done!"
echo "=> Installing docker-compose ..."
sudo curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1
echo "=> Done!"
echo ""
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