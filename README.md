[![Version](https://img.shields.io/badge/version-v1.0.0-blue.svg)](https://github.com/mekanbaymyradov/hass-addon-frp-client/tree/main)

# Hass Addon FRP Client
Home Assistant Community Add-on: FRP Client

You can leverage this add-on to achieve remote access to local Home Assistant OS by port forwarding.

## Architecture
<img width="800" src="https://github.com/huxiaoxu2019/hass-addon-frp-client/assets/5491423/58b8770e-dca5-4353-af27-e45494f78278">

## Installation
- Go to Settings -> Add-ons -> Add-on Store (bottom right)
- Click Repositories (top right)
<img width="600" src="https://github.com/huxiaoxu2019/hass-addon-frp-client/assets/5491423/699fac45-2b53-4213-811e-5fd0c4362b3b">

- Add the current repository `https://github.com/mekanbaymyradov/hass-addon-frp-client`

- Wait and refresh the Add-on Store page, then you can see one new add-on `Frp Client`, click it and install
<img width="600" src="https://github.com/huxiaoxu2019/hass-addon-frp-client/assets/5491423/0bad82a7-f535-46b1-acf6-1a4151fb6420">
<br />
<img width="600" src="https://github.com/huxiaoxu2019/hass-addon-frp-client/assets/5491423/c0941c9e-6fff-40ad-8d7b-f89d4b937f92">
<br />
<img width="600" src="https://github.com/huxiaoxu2019/hass-addon-frp-client/assets/5491423/bee156da-282a-4831-9803-8e45f4331c2c">

- Add the configurations shown as below in your `configurations.yaml` with File Editor addon
```
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 127.0.0.1
```

<img width="600"  src="https://github.com/huxiaoxu2019/hass-addon-frp-client/assets/5491423/47c4e863-1481-486a-9acb-41019c388fde">
<br />

- Restart Home Assistant after saving.

### Code of Conduct
Please note that this project follows [Home Assistant's Code of Conduct](https://www.home-assistant.io/code_of_conduct/). Be respectful and considerate in all interactions.