#!/bin/bash

current_user=$USER
current_user_path=/Users/$current_user/Desktop
metarium_path=$current_user_path/metarium_node

source ../helpers/project.sh
source ../helpers/spec_listener.sh
source ../helpers/docker_image.sh
source ../helpers/docker_listener.sh

echo "Done!"
