echo "Install prereqs..."

apt-get update -y && apt-get upgrade -y

apt-get install apt-transport-https ca-certificates gnupg2 curl software-properties-common -y

echo "Install docker..."

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

apt-get update

apt-get install docker-ce docker-ce-cli containerd.io -y

usermod -aG docker $USER

echo "Start docker service..."

service docker start

echo "Pull nginx and wordpress..."

docker pull nginx
docker pull wordpress

echo "Install docker-compose..."

curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Run docker-compose..."

cd /vagrant && docker-compose up -d
