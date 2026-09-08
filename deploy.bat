@echo off
chcp 65001 > nul
echo ==========================================
echo   [Clockwork Overdrive] Auto Deploy Script
echo ==========================================
"C:\Program Files\Git\cmd\git.exe" add .
set /p msg="커밋 메시지 입력 (엔터 시 기본값): "
if "%msg%"=="" set msg="Update Clockwork Overdrive"
"C:\Program Files\Git\cmd\git.exe" commit -m "%msg%"
"C:\Program Files\Git\cmd\git.exe" push origin main
echo ==========================================
echo  배포 완료! 30초 내에 웹사이트에 자동 반영됩니다.
echo  👉 https://intothe-rain.github.io/clockwork-overdrive/
echo ==========================================
pause
