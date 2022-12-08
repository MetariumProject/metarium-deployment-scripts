# Check if docker is installed and check installed version. Install if otherwise.
if [ -x "$(command -v docker)" ]; then
    MIN_DOCKER_VERSION="20.10.12"
    SERVER_VERSION=$(docker version -f "{{.Server.Version}}")
    SERVER_VERSION_MAJOR=$(echo "$SERVER_VERSION"| cut -d'.' -f 1)
    SERVER_VERSION_MINOR=$(echo "$SERVER_VERSION"| cut -d'.' -f 2)
    SERVER_VERSION_BUILD=$(echo "$SERVER_VERSION"| cut -d'.' -f 3)

    echo "Docker version check..."
    if [ "${SERVER_VERSION_MAJOR}" -ge 20 ] && \
    [ "${SERVER_VERSION_MINOR}" -ge 10 ]  && \
    [ "${SERVER_VERSION_BUILD}" -ge 12 ]; then
        echo "Installed docker version $SERVER_VERSION >= $MIN_DOCKER_VERSION "
    else
        echo "Installed docker version $SERVER_VERSION is less than $MIN_DOCKER_VERSION. Install cannot continue."
        echo "Please install docker $MIN_DOCKER_VERSION or later "
        exit 1
fi
else
    echo "Installing docker ..."
    sudo NEEDRESTARTMODE=a apt update && sudo apt upgrade -y
    sudo apt install docker.io -y
fi
