#! /bin/bash
wx_step=0
WEEK_DAY=$(date +%w) #��ȡ������
echo $WEEK_DAY #��ӡ������
WEEK_TIME=$(date "+%H.%M") #��ȡʱ.��
echo $WEEK_TIME #��ӡʱ.��
zs_step=$[RANDOM%2000+4000] #���ϲ���4000~6000����
zw_step=$[RANDOM%6000+8001] #���粽��8001~14001����
xw_step=$[RANDOM%6000+14002] #���粽��14002~20002����
ws_step=$[RANDOM%4000+20003] #���ϲ���20003~24003����
if [ `echo "$WEEK_TIME> 7.00 && $WEEK_TIME< 10.00"| bc` -eq 1 ];then 
      wx_step=$zs_step 
    
elif [ `echo "$WEEK_TIME> 10.01 && $WEEK_TIME< 12.30" | bc` -eq 1 ];then 
     wx_step=$zw_step 

elif [ `echo "$WEEK_TIME> 12.31 && $WEEK_TIME< 13.50" | bc` -eq 1 ];then 
     wx_step=$xw_step 

elif [ `echo "$WEEK_TIME> 18.00 && $WEEK_TIME< 23.01" | bc` -eq 1 ];then
     wx_step=$ws_step 
fi
echo $wx_step ��#��ӡ����ֵ
#��������
urlString2='curl -k -i --raw -o 0.dat "http://mib.qeqnet.com/sbu_free?u=17261998744&p=sr19981008&s=wx_step" -H "User-Agent: Apache-HttpClient/UNAVAILABLE (java 1.4)" -H "Accept-Encoding: identity" -H "Host: mib.qeqnet.com" -H "Connection: Keep-Alive"'
urlString2=${urlString2/wx_step/$wx_step} #��ֵ����ֵ
echo $urlString2 #��ӡ��������
eval $urlString2 #ִ�в�������
