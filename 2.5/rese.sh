#!/bin/bash
#�޸�ǩ������
set_week=1,2,3,4,5,7
#�����
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
#����crontab ���������ļ�
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
#���ÿ�ִ��Ȩ��
sudo chmod 777 /var/spool/cron/root
#ʹ��crontab ������ӵ���ʱ����
sudo crontab /var/spool/cron/root
#��������
sudo service cron restart
