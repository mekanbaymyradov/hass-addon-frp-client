#!/usr/bin/env bashio
WAIT_PIDS=()
CONFIG_PATH='/share/frpc.toml'
DEFAULT_CONFIG_PATH='/frpc.toml'

function stop_frpc() {
    bashio::log.info "Shutdown frpc client"
    kill -15 "${WAIT_PIDS[@]}"
}

bashio::log.info "Reading add-on configuration..."

# Export configuration values as environment variables for FRP to consume natively
export FRP_SERVER_ADDR="$(bashio::config 'serverAddr')"
export FRP_SERVER_PORT="$(bashio::config 'serverPort')"
export FRP_AUTH_TOKEN="$(bashio::config 'authToken')"
export FRP_PROXY_NAME="$(bashio::config 'proxyName')"
export LOCAL_PORT="$(bashio::config 'localPort')"
export REMOTE_PORT="$(bashio::config 'remotePort')"

# Copy the template over only if it doesn't already exist in /share
if [ ! -f "$CONFIG_PATH" ]; then
    bashio::log.info "Creating initial frpc.toml from template."
    cp $DEFAULT_CONFIG_PATH $CONFIG_PATH
else
    bashio::log.info "Using existing configuration at $CONFIG_PATH"
fi

bashio::log.info "Starting frp client"

cd /usr/src
# Run FRP; it will automatically evaluate the template tags in frpc.toml
./frpc -c $CONFIG_PATH & WAIT_PIDS+=($!)

trap "stop_frpc" SIGTERM SIGHUP
wait "${WAIT_PIDS[@]}"