function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}
fj_date=(02.09 02.10 02.11 02.12 02.13 02.14 02.15 02.16 02.17 04.03 04.05 04.05 05.01 05.02 05.03 05.04 05.05 06.12 06.13 06.14 09.19 09.20 09.21 10.01 10.02 10.03 10.04 10.05 10.06 10.07)  #放假日期	
gz_date=(02.07 02.20) #补工作日期
gz_week=(1 2 3 4 5)  #工作
xz_date=$(date "+%m.%d" ) #获取月日数 02.05
xz_week=$(date +%w) #获取星期数 5

if [ $(contains "${gz_week[@]}" "$xz_week") == "y" ]; then
    if [ $(contains "${fj_date[@]}" "$xz_date") == "y" ] ; then
       sh /root/bin/dump.sh #清除定时任务
    else 
              sh /root/bin/rese.sh #定时打卡
    fi
else 
    if [ $(contains "${fj_date[@]}" "$xz_date") == "y" ] ; then
       sh /root/bin/dump.sh  #清除定时任务
    elif [ $(contains "${gz_date[@]}" "$xz_date") == "y" ] ; then
        sh /root/bin/rese.sh #定时打卡
    else 
       sh /root/bin/dump.sh  #清除定时任务
    fi
fi
