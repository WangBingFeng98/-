#!/bin/bash
zs_randNum=$(($RANDOM%10+4))
echo -e "50" 4 \* \* \* sh /root/bin/cs.sh"
$[zs_randNum]" 21 \* \* \* sh /root/bin/wx_step.sh"\n" > /var/spool/cron/root
#���ÿ�ִ��Ȩ��
sudo chmod 777 /var/spool/cron/root
#ʹ��crontab ������ӵ���ʱ����
sudo crontab /var/spool/cron/root
#��������
sudo service cron restart
