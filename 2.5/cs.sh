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
fj_date=(02.09 02.10 02.11 02.12 02.13 02.14 02.15 02.16 02.17 04.03 04.05 04.05 05.01 05.02 05.03 05.04 05.05 06.12 06.13 06.14 09.19 09.20 09.21 10.01 10.02 10.03 10.04 10.05 10.06 10.07)  #�ż�����	
gz_date=(02.07 02.20) #����������
gz_week=(1 2 3 4 5)  #����
xz_date=$(date "+%m.%d" ) #��ȡ������ 02.05
xz_week=$(date +%w) #��ȡ������ 5

if [ $(contains "${gz_week[@]}" "$xz_week") == "y" ]; then
    if [ $(contains "${fj_date[@]}" "$xz_date") == "y" ] ; then
       sh /root/bin/dump.sh #�����ʱ����
    else 
              sh /root/bin/rese.sh #��ʱ��
    fi
else 
    if [ $(contains "${fj_date[@]}" "$xz_date") == "y" ] ; then
       sh /root/bin/dump.sh  #�����ʱ����
    elif [ $(contains "${gz_date[@]}" "$xz_date") == "y" ] ; then
        sh /root/bin/rese.sh #��ʱ��
    else 
       sh /root/bin/dump.sh  #�����ʱ����
    fi
fi
