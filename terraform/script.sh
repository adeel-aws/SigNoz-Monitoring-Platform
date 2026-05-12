#!/bin/bash
set -euxo pipefail

# ---------- Install Docker ----------
apt-get update -y
apt-get install -y docker.io docker-compose git

systemctl enable docker
systemctl start docker

# ---------- Create data directory ----------
mkdir -p /data/signoz/clickhouse
chmod -R 777 /data/signoz

# ---------- Clone repo ----------
cd /opt

git clone https://github.com/adeel-aws/SigNoz-Monitoring-Platform.git || true

cd SigNoz-Monitoring-Platform/docker

# ---------- Run stack ----------
docker-compose up -d