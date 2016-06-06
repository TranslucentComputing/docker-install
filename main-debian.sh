echo "=============================TC-INC DOCKER INSTALLATION==============================="
echo "Debian - Docker Engine & Compose installation"
echo "======================================================================================"
echo "Update packages"
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
#create file if it does not exist
sudo touch /etc/apt/sources.list.d/docker.list
#add backports for docker engine
sudo echo "deb http://http.debian.net/debian wheezy-backports main" | sudo tee --append /etc/apt/sources.list.d/docker.list
sudo apt-cache policy docker-engine
sudo apt-get update
echo "=> Done!"
echo "=> Installing docker-engine ..."
sudo apt-get install docker-engine
echo "=> Starting docker-engine ..."
sudo service docker start> /dev/null 2>&1
echo "=> Done!"
echo "=> Create Docker group and add current user to docker group"
# Add the docker group if it doesn't already exist.
$ sudo groupadd docker

# Add the connected user "${USER}" to the docker group.
# Change the user name to match your preferred user.
# You may have to logout and log back in again for
# this to take effect.
$ sudo gpasswd -a ${USER} docker

# Restart the Docker daemon.
$ sudo service docker restart
echo "=> Done!"
echo "=> Ensuring Docker starts when you boot your system, ..."
sudo systemctl enable docker
echo "=> Done!"
echo "=> Installing docker-compose ..."
sudo apt-get install -y epel-release
sudo apt-get install -y python-pip
sudo pip install --upgrade pip
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