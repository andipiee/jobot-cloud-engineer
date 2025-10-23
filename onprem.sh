#!/usr/bin/env bash
set -euo pipefail

echo "[INFO] Updating packages..."
sudo apt-get update -y

echo "[INFO] Installing Apache, MySQL client, UFW..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 mysql-client ufw

echo "[INFO] Enabling services..."
sudo systemctl enable --now apache2

echo "[INFO] Basic firewall (LAN only)..."
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 3306/tcp
echo "y" | sudo ufw enable

echo "[INFO] Test page..."
echo "<h1>On-Prem Apache is running</h1>" | sudo tee /var/www/html/index.html

echo "[DONE] On-prem simulation ready."