#!/bin/bash
# autoDNS.sh - Auto DNS Setup (Cloudflare + Google)
# Tested on Debian 11/12

set -e

echo "[INFO] Update repo & install resolvconf..."
apt update -y
apt install -y resolvconf

echo "[INFO] Setting DNS resolvers..."
mkdir -p /etc/resolvconf/resolv.conf.d

cat >/etc/resolvconf/resolv.conf.d/head <<EOF
# Custom DNS
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF

echo "[INFO] Apply resolvconf..."
resolvconf -u

echo "[INFO] Final /etc/resolv.conf content:"
cat /etc/resolv.conf

echo "[DONE] DNS sudah diatur ke 1.1.1.1, 8.8.8.8"
