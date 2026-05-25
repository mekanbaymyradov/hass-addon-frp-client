#!/usr/bin/env bashio
CONFIG_PATH='/frpc.toml'

bashio::log.info "Reading add-on configuration..."

# Export configuration values as environment variables for FRP to consume natively
export FRP_SERVER_ADDR="$(bashio::config 'serverAddr')"
export FRP_SERVER_PORT="$(bashio::config 'serverPort')"
export FRP_AUTH_TOKEN="$(bashio::config 'authToken')"
export FRP_PROXY_NAME="$(bashio::config 'proxyName')"
export LOCAL_PORT="$(bashio::config 'localPort')"
export REMOTE_PORT="$(bashio::config 'remotePort')"


bashio::log.info "Starting frp client"

cd /usr/src

exec ./frpc -c $CONFIG_PATH