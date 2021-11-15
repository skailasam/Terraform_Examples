#!/bin/sh

# Sleep until instance is ready
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do
  echo -e "\033[1;36mWaiting for cloud-init..."
  sleep 1
done

apt-get update
apt-get install apache2 -y