#!/bin/bash
#

#ʹ�÷��� sh ./send_message.sh "��������"
#��       sh ./send_message.sh "���Ի��������ڸ���"


#����Ҫ������Ա���˺�,��ͨѶ¼�ɻ�ȡ�������Ա֮��ʹ�ÿո�ָ�������Ϊչʾ����
user="cayla"
#��ҵ΢��ID:��ҵ΢�Ź������-���ҵ���ҵ��ҳ���л�ȡ
corpid="wwf8bf45a3c8c4f16e"
#Ӧ����Կ:�ڡ��Խ�Ӧ�á�-������Ӧ�á�-��Ӧ�ù����л�ȡ
corpsecret="PqGvXJoAif5r80zzDbrRyvRygmKUytOdy-4LjNn2ZWc"
#��ҵӦ��ID:��'�Խ�Ӧ��'-'����Ӧ��'-'Ӧ�ù���'�л�ȡ
agentld=1000003


#------------------------���ϱ�����Ҫ�����޸�-----------------------------------

#������Ϣ���ݱ���
msg=$1
#curl -s ��Ĭģʽ�����ǲ���ʾ����ͽ���
A=`curl -s https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$corpid\&corpsecret=$corpsecret`
#����json��ʽ ����ȡaccess_tokenֵ
token=`echo $A | jq -c '.access_token'`
#ȥ������ֵ���ߵ�˫����
token=${token#*\"}
token=${token%*\"}
#�����ַ
URL="https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$token"


for I in $user;do
	#���͵�JSON����
	JSON="{\"touser\": \"$I\",\"msgtype\": \"text\",\"agentid\": \"$agentld\",\"text\": {\"content\": \"$msg\"},\"safe\":0 }"
	#��POST�ķ�ʽ����
	curl -d "$JSON" "$URL"
done

exit 0

#http://qydev.weixin.qq.com/wiki/index.php ��ҵ�ſ���������
#text��ϢJSON��ʽ���£�
#{
#   "touser": "UserID1|UserID2|UserID3",			��ԱID�б������|�ָ���@all�������г�Ա����
#   "toparty": " PartyID1 | PartyID2 ",				����ID�б�
#   "totag": " TagID1 | TagID2 ",				��ǩID�б�
#   "msgtype": "text",						��Ϣ����
#   "agentid": 1,						��ҵӦ�õ�id
#   "text": {							
#       "content": "Holiday Request For Pony(http://xxxxx)"	��Ϣ�����������2048���ֽڣ�΢����������ʾ20����
#   },
#   "safe":0							��ʾ�Ƿ��Ǳ�����Ϣ��0��ʾ��1��ʾ�ǣ�Ĭ��0 
#}
