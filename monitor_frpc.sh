#!/bin/bash

sleep 60

FRPC_PATH="$HOME/.frp/frpc"
CONFIG="$HOME/.frp/frpc.toml"

while true; do
    # 启动 frpc
    if ! pgrep -f "frpc -c" > /dev/null; then
        echo "$(date) frpc 未运行，正在启动..." >> /tmp/monitor.log
        nohup "$FRPC_PATH" -c "$CONFIG" > /dev/null 2>&1 &
        sleep 15
    fi

    sleep 30

    # 检测进程是否退出
    if ! pgrep -f "frpc -c" > /dev/null; then
        echo "$(date) frpc 进程已退出，准备重启系统..." >> /tmp/monitor.log
        reboot
    fi

    # 检测 frpc 是否有任何 ESTABLISHED 的对外连接
    established_count=$(ss -tnp | grep "frpc" | grep ESTAB | wc -l)

    if [ "$established_count" -eq 0 ]; then
        # 再确认一次
        sleep 5
        established_count=$(ss -tnp | grep "frpc" | grep ESTAB | wc -l)

        if [ "$established_count" -eq 0 ]; then
            echo "$(date) frpc 无有效连接（已断开），准备重启系统..." >> /tmp/monitor.log
            reboot
        fi
    fi

    sleep 30
done
