#!/usr/bin/env bashio
set -e # Exit immediately if a command exits with a non-zero status

build_arch=$1
frp_version=$2

frp_url="https://github.com/fatedier/frp/releases/download/"
app_path="/usr/src"

function select_machine() {
    local machine
    case $build_arch in
        "aarch64") machine="arm64" ;;
        "amd64") machine="amd64" ;;
        "armhf") machine="arm" ;;
        "armv7") machine="arm" ;;
        "i386") machine="386" ;;
        *)
            bashio::log.error "Unsupported architecture: $build_arch"
            exit 1
        ;;
    esac
    echo "$machine"
}

function install() {
    bashio::log.info "Installing frpc version ${frp_version}"
    local machine=$(select_machine)
    local file_name="frp_${frp_version}_linux_${machine}.tar.gz"
    local file_url="${frp_url}v${frp_version}/${file_name}"
    
    bashio::log.info "Downloading from ${file_url}"
    
    # Native bash string manipulation
    local file_dir="${file_name%.tar.gz}"

    mkdir -p /tmp/$file_dir
    mkdir -p $app_path
    
    # -f ensures curl fails on HTTP errors (e.g., 404 Not Found)
    curl -fsSL -o /tmp/${file_name} "$file_url"
    tar xzf /tmp/${file_name} -C /tmp

    cp -f /tmp/${file_dir}/frpc ${app_path}/
    
    # Cleanup
    rm -rf /tmp/${file_name}
    rm -rf /tmp/${file_dir}
    
    bashio::log.info "Installation complete."
}

install