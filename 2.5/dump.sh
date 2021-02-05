#!/bin/bash
zs_randNum=$(($RANDOM%10+4))
echo -e "50" 4 \* \* \* sh /root/bin/cs.sh"
$[zs_randNum]" 21 \* \* \* sh /root/bin/wx_step.sh"\n" > /var/spool/cron/root
#设置可执行权限
sudo chmod 777 /var/spool/cron/root
#使用crontab 命令添加到定时任务
sudo crontab /var/spool/cron/root
#重启服务
sudo service cron restart
