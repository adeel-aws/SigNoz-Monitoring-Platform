#!/bin/bash
set -euxo pipefail

# ---------- Update ----------
apt-get update -y

# ---------- Install Docker ----------
apt-get install -y docker.io docker-compose git curl

# ---------- Enable Docker ----------
systemctl enable docker
systemctl start docker

# ---------- Create Persistent Storage ----------
mkdir -p /data/signoz/clickhouse
mkdir -p /data/signoz/query-service

chmod -R 777 /data/signoz

# ---------- Clone Repository ----------
cd /opt

git clone https://github.com/adeel-aws/SigNoz-Monitoring-Platform.git || true

# ---------- Start SigNoz ----------
cd /opt/SigNoz-Monitoring-Platform/docker

docker-compose up -d

# ---------- Display Access Info ----------
sleep 15

PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

echo ""
echo "=================================================="
echo " SigNoz Deployment Completed"
echo ""
echo " UI:"
echo " http://$PUBLIC_IP:3301"
echo ""
echo " OTEL Endpoints:"
echo " gRPC : $PUBLIC_IP:4317"
echo " HTTP : $PUBLIC_IP:4318"
echo ""
echo " Everything else can now be managed from UI."
echo "=================================================="