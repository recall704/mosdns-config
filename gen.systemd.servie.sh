#!/bin/bash

# 获取当前脚本对应目录，放在变量 WORK_DIR 中
WORK_DIR=$(cd "$(dirname "$0")"; pwd)

BIN_NAME="mosdns"


cat > /etc/systemd/system/mosdns.service << EOF
[Unit]
Description=Mosdns Service
After=network-online.target
Wants=network-online.target

[Service]
WorkingDirectory=$WORK_DIR
ExecStart=$WORK_DIR/$BIN_NAME start -c config.yaml
User=shellclash
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF
