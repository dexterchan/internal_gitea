sudo yum install -y docker
sudo service docker start 
sudo systemctl enable docker.service
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker ssm-user

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
ARCH=$(uname -m)
curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-${ARCH} -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
docker compose version