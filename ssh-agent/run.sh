# Load the ssh-agent docker container

# Source .env
dir="$(dirname "$0")"
if [[ -f "$dir/.env" ]]; then
  source "$dir/.env"
elif [[ -f "$dir/.env.example" ]]; then
  source "$dir/.env.example"
fi

# SSH key argument
SSH_KEY_FILE="${SSH_KEY_FILE:-$HOME/.ssh/id_rsa}"

# Constant variables
image_name="whilp/ssh-agent:latest"
container_name="ssh-agent"
ssh_volume="ssh:/ssh"
uid=1001

# Output colors
underline='\033[4;37m'
purple='\033[0;35m'
bold='\033[1;37m'
green='\033[0;32m'
cyan='\033[0;36m'
red='\033[0;31m'
nc='\033[0m'

# Find agent container id
id=$(docker ps -a|grep ssh-agent|awk '{print $1}')

# Stop command
if [ "$1" == "-s" ] && [ $id ]; then
  echo "Removing ssh-keys..."
  docker run --rm -v $ssh_volume -it $image_name ssh-add -D
  echo "Stopping ssh-agent container..."
  docker rm -f $id
  exit
fi

# If container is already running, exit.
if [ $id ]; then
  echo "A container named 'ssh-agent' is already running."
  printf "Do you wish to stop it? (y/N): "
  read input

  if [ "$input" == "y" ]; then
    echo "Removing SSH keys..."
    docker run --rm -v $ssh_volume -it $image_name ssh-add -D
    echo "Stopping ssh-agent container ..."
    docker rm -f $id
    echo "${red}Stopped.${nc}"
  else
    exit
  fi
fi

# Run ssh-agent
echo "${bold}Launching ssh-agent container ...${nc}"
docker run -u $uid -d -v $ssh_volume --network ${DOCKER_NETWORK:-default} --name=$container_name --restart=always $image_name

echo "Adding your ssh keys to the ssh-agent container ..."
docker run -u $uid --rm -v $ssh_volume -v $HOME:$HOME -it $image_name ssh-add $SSH_KEY_FILE

echo "${green}ssh-agent is now ready to use.${nc}"
