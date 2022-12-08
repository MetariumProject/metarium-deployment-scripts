echo "Configuring local permission to run docker container"
sudo usermod -a -G docker $current_user
sudo chmod 666 /var/run/docker.sock
sudo chown 1000.1000 $metarium_path/chain-data -R