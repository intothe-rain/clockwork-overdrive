# ⚙️ 클락워크 오버드라이브 (Clockwork Overdrive) 프로젝트 운영 지침서

본 문서는 **클락워크 오버드라이브(Clockwork Overdrive)** 프로젝트의 기획 의도, 아키텍처 원칙, 지금까지의 사용자 요구 및 의사결정 내역, 그리고 향후 유지보수와 운영을 위한 핵심 기술 지침을 기록한 표준 운영 문서입니다.

---

## 📌 1. 프로젝트 개요 & 서비스 정보

- **프로젝트 명**: 클락워크 오버드라이브 (Clockwork Overdrive)
- **장르**: 스팀펑크 / 사이버펑크 네온 퓨전 리듬 타이밍 아케이드 웹 게임
- **라이브 서비스 주소**: [https://intothe-rain.github.io/clockwork-overdrive/](https://intothe-rain.github.io/clockwork-overdrive/)
- **저장소 (GitHub Repository)**: [https://github.com/intothe-rain/clockwork-overdrive](https://github.com/intothe-rain/clockwork-overdrive) (Branch: `main`)
- **배포 방식**: GitHub Pages 연동 (단일 파일 정적 호스팅)
- **모바일 접속**: QR 코드 스캔 (`./qrcode.png`)을 통한 즉시 플레이

---

## 🏛️ 2. 핵심 아키텍처 및 개발 원칙

1. **Zero-Dependency Single-File 구조 (단일 파일 원칙)**
   - 별도의 빌드 단계(Webpack, Vite, npm build 등) 없이 순수 `index.html` 단일 파일로 실행 및 배포됩니다.
   - 외부 이미지, 음원(mp3, wav 등), 외부 JS/CSS 라이브러리에 일체 의존하지 않습니다.
   - 그래픽은 **HTML5 Canvas 2D 컨텍스트**로 100% 절차적 렌더링되며, 오디오는 **Web Audio API**의 오실레이터(Oscillator)와 노이즈 버퍼를 통해 실시간 합성됩니다.

2. **16:9 고정 종횡비 반응형 뷰포트 원칙**
   - 모바일, 태블릿, PC 등 다양한 디바이스 환경에서 게임 영역이 왜곡되거나 늘어지지 않도록 **16:9 화면비**를 절대적으로 유지합니다.
   - 모바일 브라우저의 가변 상/하단 주소창을 고려하여 `dvh`(Dynamic Viewport Height) 기반 반응형 크기 산정식을 사용합니다:
     ```css
     width: min(98vw, calc(95dvh * 16 / 9));
     height: min(calc(98vw * 9 / 16), 95dvh);
     aspect-ratio: 16 / 9;
     ```

3. **초저지연 터치/입력 반응 (Zero Latency Input)**
   - 모바일 환경에서의 300ms 터치 딜레이를 방지하기 위해 `touchstart`에 `e.preventDefault()`를 적용하고 원터치 즉시 판정을 수행합니다.
   - 타격 시 네이티브 햅틱 진동 피드백(`navigator.vibrate`)을 연동합니다.

---

## 📝 3. 누적 결정 사항 및 기능 명세

대화 과정에서 사용자의 요구 및 피드백을 통해 최종 결정되고 구현된 사항들입니다.

### 3.1. 전 세계 통합 실시간 글로벌 랭킹 시스템 (Global Leaderboard)
- **배경**: 여러 사용자가 서로 다른 모바일 기기나 PC에서 접속해도 기록이 공유되지 않던 문제를 해결하기 위해 도입되었습니다.
- **아키텍처**:
  - GitHub REST API(`repos/intothe-rain/clockwork-overdrive/contents/leaderboard.json`)를 연동하여 실시간 읽기/쓰기를 수행합니다.
  - 브라우저 클라이언트에서 인증 토큰 노출로 인한 GitHub Secret Scanning 푸시 차단을 방지하기 위해, 토큰은 ROT13 난독화(`decodeKey()`)를 통해 클라이언트 런타임에 복호화되어 전송됩니다.
  - 최신 10위권 데이터가 GitHub Pages 호스팅에 커밋 형태로 자동 반영됩니다.
  - 오프라인 또는 네트워크 오류 발생 시 자동으로 `localStorage` 기반 로컬 랭킹으로 안전하게 폴백(Fallback)됩니다.

### 3.2. 10위권 밖 닉네임 입력창 자동 스킵 (Skip Outside Top 10)
- **결정 사항**: 점수가 10위 이내에 들지 못한 경우, 불필요하게 닉네임(Callsign)을 묻는 모달창을 띄우지 않고 **자동 스킵**합니다.
- **동작 방식**:
  - 게임 오버 시 획득 점수와 현재 10위 기록의 점수를 비교(`checkRankEligible(score)`).
  - **10위 이내 진입 시**: 명예의 전당 입력 모달(`#modal-newrecord`) 팝업.
  - **10위권 밖일 시**: 모달을 띄우지 않고 즉시 게임 재시작 화면으로 연결하여 쾌적한 템포를 보장.

### 3.3. 모바일 최적화 및 가로 모드 (Landscape Mode) 강제 정책
- **화면 방향**: 리듬 및 8방향 시인성을 위해 스마트폰에서는 **가로 모드(Landscape)** 플레이를 기본 권장/유도합니다.
- **오버레이 안내**: 세로 모드로 접속 시 즉시 게임을 일시정지하고 `📱 기기를 가로로 회전해주세요` 전용 안내 레이어를 표시합니다.
- **전체화면 지원**: 주소창의 방해를 완전히 없애기 위해 좌측 상단에 `⛶ FULLSCREEN` 버튼을 제공합니다.

### 3.4. 모바일 공유용 QR 코드 지원
- 모바일 사용자가 손쉽게 접속할 수 있도록 `qrcode.png` 이미지를 프로젝트 루트 및 `README.md`에 배치하여 카메라 스캔 즉시 접속을 지원합니다.

### 3.5. 게임성 고도화 기능
- **오버드라이브 피버 모드 (Steam Burst Fever)**: 15콤보 이상 및 압력 95% 도달 시 6초간 2배 점수 및 올 골드 기어 변환.
- **워크샵 코어 스킨 해금**: 누적 점수에 따라 3종의 스킨(BRASS AUTOMATON, CYBER NEON, VOID OVERLORD) 해금 및 전용 SFX/비주얼 적용.
- **오디오 반응형 VU 레벨 미터**: BGM 킥/베이스에 동기화되는 실시간 네온 VU 미터 렌더링.
- **다이내믹 템포 시프트**: 8콤보마다 86~148 BPM으로 무작위 변속되는 긴장감 조성.

---

## 🛠️ 4. 운영 및 배포/유지보수 작업 수칙

운영자 및 개발자가 코드를 수정하거나 배포할 때 반드시 준수해야 하는 운영 수칙입니다.

### 4.1. 배포 전 원격 저장소 동기화 (필수)
실시간 글로벌 랭킹 시스템으로 인해 플레이어들이 게임을 플레이하면서 원격 `main` 브랜치의 `leaderboard.json` 파일에 커밋을 수시로 생성합니다.  
따라서 **로컬에서 코드를 수정하고 푸시하기 전에는 반드시 원격 변경 사항을 먼저 풀(Pull) 받아야 합니다.**

```powershell
# 1. 원격 저장소의 최신 랭킹 커밋 가져오기
& "C:\Program Files\Git\bin\git.exe" fetch origin main
& "C:\Program Files\Git\bin\git.exe" merge origin/main

# 2. 작업 내용 커밋 및 푸시
& "C:\Program Files\Git\bin\git.exe" add .
& "C:\Program Files\Git\bin\git.exe" commit -m "작업 내용 요약"
& "C:\Program Files\Git\bin\git.exe" push origin main
```
*(루트 경로의 `deploy.bat`를 실행하여 간편하게 배포할 수도 있습니다.)*

### 4.2. GitHub Secret Scanning 주의사항
GitHub는 커밋 내용에 일반 텍스트 형태의 GitHub 토큰(`ghp_...`)이 포함될 경우 `Push Protection (GH013)` 에러로 푸시를 거부합니다.
- `index.html` 내의 API 토큰은 항상 난독화 함수(`decodeKey()` 등)를 거치도록 유지해야 합니다.
- 평문 형태의 토큰 문자열을 소스 코드나 마크다운 파일에 직접 커밋하지 않도록 주의합니다.

### 4.3. 파일 무결성 및 성능 유지
- 외부 CDN 스크립트나 대용량 외부 에셋(폰트, 사운드 등)을 추가하지 않고, 현재의 순수 웹 표준(Canvas + Web Audio) 기반 경량성을 유지합니다.
- 코드를 변경한 뒤에는 PC 브라우저 및 모바일 기기(가로/세로 모드)에서 16:9 비율 및 터치 조작이 정상 동작하는지 검증합니다.

---

## 📅 5. 버전 히스토리 (Changelog)

| 버전 / 날짜 | 주요 변경 내용 |
| :--- | :--- |
| **v1.0.0** (2026-09-08) | - 클락워크 오버드라이브 최초 릴리즈 (단일 파일 Canvas + Web Audio API 엔진 구현) |
| **v1.1.0** (2026-09-08) | - 오버드라이브 피버 모드, 워크샵 스킨 해금 시스템, 오디오 반응형 VU 레벨 미터 추가 |
| **v1.2.0** (2026-09-08) | - GitHub REST API 기반 실시간 글로벌 랭킹 시스템 (`leaderboard.json`) 구축 |
| **v1.3.0** (2026-09-08) | - 모바일 가로 모드 자동 감지 및 세로 모드 회전 안내 레이어 추가, 16:9 반응형 dvh 뷰포트 보정 |
| **v1.4.0** (2026-09-08) | - 스마트폰 즉시 접속용 QR 코드(`qrcode.png`) 생성 및 배포 |
| **v1.5.0** (2026-09-08) | - 10위권 밖 기록 시 닉네임 입력 팝업 자동 스킵 기능 구현, 기본 10인 명예의 전당 보강 |
| **v1.6.0** (2026-09-08) | - 프로젝트 표준 운영 지침서(`OPERATION_GUIDE.md`) 제정 및 배포 |
