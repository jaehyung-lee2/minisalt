# minisalt

## 개요
기존에 여러 서버에 일괄적으로 command를 보내기 위해 [salt-console](https://salt-console.nhnent.com)을 이용중이었는데 
커맨드에 따라 응답에 실패하는 서버 또는 전체 서버가 응답을 못해버리는 경우가 자주 발생해서 불편함이 있었습니다.

따라서 직접 서버그룹을 지정하고 빠르게 지정된 서버그룹 전체에 커맨드를 일괄적으로 보낼 수 있도록 만들어진 스크립트 입니다.

## 사용법
1. 게이트웨이에서 `git clone https://github.com/jaehyung-lee2/minisalt.git`
2. minisalt 디렉토리 내 servers.json 수정 (아래 예시 참고)
예시)
```json
{
    "SMS_BETA_WEB": [
        "smsw-pubwebbta-wa901", 
        "smsw-pubwebbta-wb901"
    ],
    "SMS_BETA_PRI_API": [
        "smsw-priapibta-wa901", 
        "smsw-priapibta-wb901"
    ]
}
```

3. minisalt.sh 실행 `sh minisalt.sh`
4. 서버그룹 선택 후 command를 차례로 입력하여 결과 확인

![image](https://github.com/jaehyung-lee2/minisalt/assets/129833216/c5ada65c-4937-4689-8551-39a601446590)
