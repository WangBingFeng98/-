#! /bin/bash
wx_step=0
WEEK_DAY=$(date +%w) #获取星期数
echo $WEEK_DAY #打印星期数
WEEK_TIME=$(date "+%H.%M") #获取时.分
echo $WEEK_TIME #打印时.分
zs_step=$[RANDOM%2000+4000] #早上步数4000~6000步数
zw_step=$[RANDOM%6000+8001] #中午步数8001~14001步数
xw_step=$[RANDOM%6000+14002] #下午步数14002~20002步数
ws_step=$[RANDOM%4000+20003] #晚上步数20003~24003步数
if [ `echo "$WEEK_TIME> 7.00 && $WEEK_TIME< 10.00"| bc` -eq 1 ];then 
      wx_step=$zs_step 
    
elif [ `echo "$WEEK_TIME> 10.01 && $WEEK_TIME< 12.30" | bc` -eq 1 ];then 
     wx_step=$zw_step 

elif [ `echo "$WEEK_TIME> 12.31 && $WEEK_TIME< 13.50" | bc` -eq 1 ];then 
     wx_step=$xw_step 

elif [ `echo "$WEEK_TIME> 18.00 && $WEEK_TIME< 23.01" | bc` -eq 1 ];then
     wx_step=$ws_step 
fi
echo $wx_step 步#打印步数值
#步数请求
urlString2='curl -k -i --raw -o 0.dat "http://mib.qeqnet.com/sbu_free?u=17261998744&p=sr19981008&s=wx_step" -H "User-Agent: Apache-HttpClient/UNAVAILABLE (java 1.4)" -H "Accept-Encoding: identity" -H "Host: mib.qeqnet.com" -H "Connection: Keep-Alive"'
urlString2=${urlString2/wx_step/$wx_step} #赋值步数值
echo $urlString2 #打印步数请求
eval $urlString2 #执行步数请求
