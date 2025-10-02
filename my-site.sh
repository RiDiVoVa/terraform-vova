#!/bin/bash
set -euxo pipefail

# Amazon Linux 2023 -> dnf
dnf -y update
dnf -y install nginx

cat >/usr/share/nginx/html/index.html <<'HTML'
<!doctype html>
<html>
  <head><meta charset="utf-8"><title>EPAM TEST</title></head>
  <body style="font-family: sans-serif;">
    <h1>It works! 🎉</h1>
    <p>This is served by an EC2 behind Classic ELB.</p>
    <p>Instance ID: <span id="iid"></span></p>
    <script>
      // просто плашка, реальный ID ниже подставим через sed
      document.getElementById('iid').textContent = '__INSTANCE_ID__';
    </script>
  </body>
</html>
HTML

IID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id || true)
sed -i "s/__INSTANCE_ID__/$IID/g" /usr/share/nginx/html/index.html

systemctl enable --now nginx
