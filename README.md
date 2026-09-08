# ⚙️ 클락워크 오버드라이브 (Clockwork Overdrive)

> **"증기와 톱니바퀴의 고속 심포니! 8방향 소용돌이 기어를 코어에 맞물려 한계 돌파(OVERDRIVE)를 달성하세요!"**

스팀펑크와 사이버펑크 네온이 결합된 PC 웹 브라우저용 고감도 캐주얼 아케이드 리듬 타이밍 게임입니다.  
외부 라이브러리나 이미지, 음원 파일 없이 **순수 HTML5 Canvas, Vanilla JavaScript, 그리고 Web Audio API**만을 사용하여 100% 자체 합성된 사운드와 그래픽으로 구동되는 **단일 파일(Single File)** 구조로 완성되었습니다.

---

## 🎮 게임 플레이 (How to Play)

1. **실행**: `index.html` 파일을 웹 브라우저(PC / 스마트폰 모바일 브라우저)로 열어 실행합니다.  
   - **온라인 라이브 플레이**: [GitHub Pages 바로가기](https://intothe-rain.github.io/clockwork-overdrive/)
2. **조작법**:
   - **타이밍 타격**:
     - **PC**: `Space` 키 또는 `마우스 좌클릭`
     - **모바일**: 화면 아무 곳이나 **원터치 (0ms 반응)** + 햅틱 진동 피드백
   - **전체화면 모드 (모바일 추천)**: 좌측 상단 `⛶ FULLSCREEN` 버튼 클릭
   - **일시정지 / 재개**: `ESC` 키 또는 화면 내 일시정지
   - **모바일 환경 안내**: 스마트폰을 **가로 모드(Landscape)**로 회전하면 즉시 최적화된 아케이드 화면으로 자동 전환됩니다. (세로 모드 감지 시 회전 안내 오버레이 제공)
   - 360도 8방향 외곽에서 방사형, 소용돌이 나선형, 웨이브 궤도를 그리며 중심으로 수렴하는 **보석 기어(Gem Gears)**를 관찰합니다.
   - 보석 기어가 중앙 메인 코어의 톱니 홈과 **정확히 맞물리는 순간**에 맞춰 `Space` 또는 `마우스 클릭`을 입력합니다.
   - 연속 콤보를 달성하여 증기 압력 게이지를 채우고, 8콤보마다 급변하는 **랜덤 BPM 변속**에 맞춰 최고 점수를 갱신하세요!

---

## 🌟 주요 게임 특징 (Key Features)

### 1. 🏆 명예의 전당 (Global World & Local Leaderboard)
- **전 세계 통합 글로벌 랭킹 (Global Cloud Sync)**: 여러 스마트폰, 태블릿, PC 등 **어떤 디바이스에서 접속하더라도 전 세계 플레이어들의 최고 기록이 실시간으로 공유 및 동기화**됩니다!
- **로컬 & 글로벌 탭 전환**: `🌐 GLOBAL WORLD` 및 `📱 LOCAL DEVICE` 탭을 통해 전 세계 순위와 내 기기 기록을 자유롭게 전환 조회.
- 게임 오버 시 10위권 진입 시 **콜사인(Callsign) 닉네임 입력 모달** 팝업 및 글로벌 서버 즉시 등록!
- 순위, 플레이어명, 점수, 최대 콤보, 최고 BPM, 달성 일자 기록.

### 2. 🔥 오버드라이브 피버 모드 (Steam Burst Fever)
- 콤보가 15 이상 쌓이고 증기 압력 게이지가 95% 이상 과열되면 **6초간 피버 모드 폭발**!
- **모든 점수 2배(2X SCORE)** + 전 화면 황금 과열 오라 + 모든 진입 기어가 골드 보석 기어로 변신!

### 3. 🎨 워크샵 코어 & 기어 스킨 해금 시스템 (Workshop Skins)
- 누적 점수에 따라 새로운 스킨 해금 및 원클릭 장착:
  - **BRASS AUTOMATON**: 클래식 황동 스팀펑크 코어 (기본)
  - **CYBER NEON**: 8,000점 해금 - 청록색 네온 코어 & 고주파 일렉트릭 SFX
  - **VOID OVERLORD**: 18,000점 해금 - 보라빛 암흑 물질 코어 & 중저음 공허 SFX

### 4. 📊 반응형 오디오 비주얼라이저 (Audio Reactive VU Meter)
- BGM의 묵직한 펀치 킥과 베이스 주파수에 완벽히 동기화되어 화면 하단 좌우에서 솟구치는 아날로그 네온 레벨 미터.

### 5. 🎛️ 실시간 BPM 반응형 고품질 Web Audio BGM
- 외부 mp3 로딩 없이, 브라우저 내부 오실레이터와 노이즈 버퍼를 통해 실시간으로 합성되는 **4트랙 일렉트로 스윙 / 펑크 신디사이저 BGM**:
  - **4코드 진행 (Am - F - C - G)**: 풍성한 3~4화음 폴리포닉 신스 패드
  - **드럼 아키텍처**: 펀치 트랜지언트 서브베이스 킥 + 리버브 스팀 스네어 + 스윙 셔플 16비트 하이햇 + 스팀 크래시 심벌
  - **슬랩 베이스 & 리드 신스**: 사이드체인 어택 슬랩 베이스라인과 4마디 아케이드 리드 훅
- 타격 시 터지는 황동 클랭크 금속음, "치익- 쾅!" 증기 배출음, 미스 시 기계 삐걱거림, 게임오버 파쇄음 100% 자체 합성.

### 2. ⚡ 다이내믹 랜덤 BPM 변속 시스템 (Dynamic Gear Shift)
- 단순 선형 가속에서 벗어나, **연속 8콤보 달성 시마다 86 ~ 148 BPM 사이에서 랜덤으로 템포가 급변속**:
  - `⚡ ACCEL SHIFT`: 갑자기 130~140+ BPM으로 치솟는 극한의 긴장감
  - `🌀 SLOW SHIFT`: 90 BPM대로 뚝 떨어져 정교한 박자감을 시험하는 변칙 슬로우
  - 변속 시 증기 사이렌 고동음과 전자기 워프 쇼크웨이브 방출

### 3. 🌀 8방향 방사 & 나선 소용돌이(Spiral) & 웨이브 궤도
- 기존의 단순 좌/우 이동을 넘어선 다채로운 궤도:
  - **RADIAL**: 360도 8방향 어디서든 중심으로 직선 쇄도
  - **SPIRAL CW / CCW**: 중앙 코어 주위를 1.25바퀴 이상 휘감으며 빨려 들어오는 나선 소용돌이
  - **WAVE**: S자 물결을 타며 다가오는 변칙 궤도
  - 각 기어마다 뒤로 남는 화려한 **네온 잔상 모션 트레일(Motion Trail)**

### 4. 💎 캐주얼 아케이드 비주얼 & 쥬시(Juicy) 피드백
- **5대 보석 테마 기어**: 루비 레드, 앰버 골드, 사파이어 블루, 에메랄드 그린, 아메지스트 퍼플
- **비트 바운스(Beat Bumping)**: 음악의 킥/스네어에 맞춰 중앙 기어가 심장처럼 쿵쾅거리는 쫀득한 젤리 애니메이션
- **네온 쇼크웨이브 & 스파크**: 정타 성공 시 퍼져나가는 충격파 링과 24개의 오색 스파크 폭죽
- **에너지 코어 (라이프 3개)**: 3회 미스 허용 및 3진 아웃 시 기계 부품 60개 파편 폭발 연출
- **영구 기록 저장(LocalStorage)**: 역대 최고 점수(BEST SCORE), 최대 콤보, 최고 도달 BPM 브라우저 저장

---

## 🎯 판정 시스템 (Judgement Window)

| 판정 (Rank) | 타이밍 윈도우 | 점수 및 콤보 | 피드백 연출 |
| :--- | :---: | :---: | :--- |
| **PERFECT!!** | $\pm 55\text{ ms}$ | 300점 + 콤보×25 | 화면 진동, 대형 네온 충격파, 24개 스파크, 증기 배출 |
| **GOOD!** | $\pm 115\text{ ms}$ | 150점 + 콤보×12 | 화면 진동, 소형 충격파, 12개 스파크, 금속 타격음 |
| **MISS** | 그 외 / 타이밍 이탈 | 0점, 콤보 리셋 | 적색 화면 점멸, 기계 삐걱거림, 에너지 코어 1개 파괴 |

---

## 🚀 배포 가이드 (Deployment Guide)

이 프로젝트는 **단일 파일(`index.html`)**로 구성되어 있어 빌드 과정(Webpack, Vite 등) 없이 어디서든 즉시 배포할 수 있습니다.

### 방법 1. 로컬 환경에서 바로 실행
- 폴더 내의 `index.html` 파일을 더블 클릭하여 기본 브라우저로 엽니다.
- 또는 터미널에서 경량 웹 서버 구동:
  ```bash
  # Python 3
  python -m http.server 8000
  # Node.js npx
  npx serve .
  ```
  브라우저에서 `http://localhost:8000` 접속

### 방법 2. GitHub Pages 무료 웹 호스팅 배포 (추천)
1. GitHub에 새 저장소(Repository)를 생성합니다.
2. `index.html`과 `README.md`를 푸시(Push)합니다:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Clockwork Overdrive Game"
   git branch -M main
   git remote add origin https://github.com/{사용자이름}/{저장소이름}.git
   git push -u origin main
   ```
3. 저장소의 **Settings > Pages** 메뉴로 이동합니다.
4. **Branch**를 `main`, 폴더를 `/ (root)`로 설정하고 **Save**를 클릭합니다.
5. 1~2분 후 생성되는 고유 URL(`https://{사용자이름}.github.io/{저장소이름}/`)로 전 세계 누구나 접속하여 게임을 플레이할 수 있습니다!

### 방법 3. Netlify / Vercel 배포
- [Netlify Drop](https://app.netlify.com/drop)에 `index.html`이 있는 폴더를 드래그 앤 드롭하기만 하면 10초 만에 무료 웹사이트가 생성됩니다.

---

## 🛠️ 기술 스택 (Tech Stack)

- **Language**: HTML5, CSS3, Vanilla JavaScript (ES6+)
- **Graphics Engine**: HTML5 2D Canvas Context (1280x720 16:9 반응형 뷰포트)
- **Audio Engine**: Web Audio API (Multi-oscillator, Custom Noise Buffer, Dynamic Filter Sweep, Scheduler Lookahead)
- **Data Persistence**: HTML5 Web Storage API (`localStorage`)
- **Typography**: Google Fonts (Chakra Petch, Orbitron)

---

## 📜 라이선스 (License)

MIT License. 누구나 자유롭게 수정, 배포 및 학습 용도로 활용할 수 있습니다.
