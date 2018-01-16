#
# Setup common docker environment variables
#

# The External Host Network IP
export HOST_NETWORK_IP=${HOST_NETWORK_IP:-${$(ipconfig getifaddr en0):-127.0.0.1)}}

# Docker network
export DOCKER_HOST_IP=${HOST_NETWORK_IP}
export DOCKER_NETWORK=${DOCKER_NETWORK:-default}
