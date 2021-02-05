#!/bin/bash
#修改签到星期
set_week=1,2,3,4,5,7
#随机数
zs_randNum=$(($RANDOM%10+4))
zw_randNum=$(($RANDOM%10+1))
xw_randNum=$(($RANDOM%10+35))
ws_randNum=$(($RANDOM%18+40))

zs1_randNum=$(($RANDOM%15+5))
zw1_randNum=$(($RANDOM%10+1))
xw1_randNum=$(($RANDOM%10+35))
ws1_randNum=$(($RANDOM%10+31))

zs2_randNum=$(($RANDOM%15+6))
zw2_randNum=$(($RANDOM%11+1))
xw2_randNum=$(($RANDOM%11+35))
ws2_randNum=$(($RANDOM%10+30))
#path /var/spool/cron/crontabs
#生成crontab 任务配置文件
echo -e "50" 4 \* \* \* sh /root/bin/cs.sh"
$[zs_randNum]" 21 \* \* \* sh /root/bin/wx_step.sh"\n
$[zs_randNum]" 8 \* \* \* sh /root/bin/1wbingfeng.sh"
$[zw_randNum]" 12 \* \* \* sh /root/bin/1wbingfeng.sh"
$[xw_randNum]" 12 \* \* \* sh /root/bin/1wbingfeng.sh"
$[ws_randNum]" 19 \* \* \* sh /root/bin/1wbingfeng.sh"\n
$[zs1_randNum]" 8 \* \* \* sh /root/bin/2wqianlan.sh"
$[zw1_randNum]" 12 \* \* \* sh /root/bin/2wqianlan.sh"
$[xw1_randNum]" 12 \* \* \* sh /root/bin/2wqianlan.sh"
$[ws1_randNum]" 19 \* \* \* sh /root/bin/2wqianlan.sh"\n
$[zs2_randNum]" 8 \* \* \* sh /root/bin/3cying.sh"
$[zw2_randNum]" 12 \* \* \* sh /root/bin/3cying.sh"
$[xw2_randNum]" 12 \* \* \* sh /root/bin/3cying.sh"
$[ws2_randNum]" 19 \* \* \* sh /root/bin/3cying.sh"" > /var/spool/cron/root
#设置可执行权限
sudo chmod 777 /var/spool/cron/root
#使用crontab 命令添加到定时任务
sudo crontab /var/spool/cron/root
#重启服务
sudo service cron restart
