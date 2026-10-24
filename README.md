# ddns-scripts-onamae

OpenWrt/LEDE Dynamic DNS (DDNS) Client scripts extension for 'onamae.com'.

## Configurations

- domain: hostname@yourdomain.TLD
- username: onamae.com Navi onamae ID
- password: onamae.com Navi password

## Depends

- ddns-scripts
- openssl-util

## Install

### As a feed

Add to `feeds.conf` in the OpenWrt build tree:

```
src-git onamae https://github.com/ktdevx/ddns-scripts-onamae.git
```

Then:

```
./scripts/feeds update onamae
./scripts/feeds install -a -p onamae
```

and select `Network > IP Addresses and Names > ddns-scripts-onamae`.

### From a release

Download the package from the Releases page and install it.

- OpenWrt 24.10 or earlier: `opkg install ddns-scripts-onamae_*.ipk`
- OpenWrt 25.12 or later: `apk add --allow-untrusted ./ddns-scripts-onamae-*.apk`
