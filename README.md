📌 프로젝트 설명

간단한 KTX 좌석 예약 앱으로, 출발역과 도착역을 선택하고 좌석을 선택하여 예약까지 완료할 수 있습니다. Flutter의 기본 위젯 구조와 상태 관리 원리를 이해하고 직접 적용해보는 데 초점을 맞췄습니다.

✅ 필수 기능 완료 내역

UI 명세서 반영: 페이지별 배치, 버튼 스타일 등 요구사항과 동일하게 구성

Stateless/Stateful 구분: 상태 변화가 없는 페이지(StationPage)는 StatelessWidget으로, 상태 관리가 필요한 페이지(HomePage, SeatPage)는 StatefulWidget으로 구현

HomePage 구현: 출발/도착역 선택 흐름과 유효성 검사 다이얼로그 포함

StationListPage 구현: StationPage로 구현, 역 리스트 출력 및 선택 반환 처리

SeatPage 구현: 좌석 선택 화면, 선택 로직, 예약 버튼 동작까지 포함

🚀 도전 기능 완료 내역

반복 컴포넌트화: SelectButton, Seat, SeatLine, ReservationButton으로 공통 UI 재사용

UX 고려 (같은 역 선택 방지): 출발역과 도착역 동일 선택 불가 로직 적용

다크 테마 적용 구조: ThemeMode, ColorScheme로 테마 구조 작성

🟢 main.dart

앱 시작점 main() → runApp(MyApp())

MyApp 클래스: 앱 전체를 감싸는 StatelessWidget

MaterialApp: 기본 테마에 Material 3 적용

ThemeMode.light: 다크 모드 대응 구조 포함 (시드 컬러 주석)

홈화면: HomePage 연결

🏠 homepage.dart

HomePage: 출발역/도착역 선택 메인 페이지

StatefulWidget → 출발역(startStation), 도착역(endStation) 변수로 상태 관리

SelectButton → StationPage로 이동, 선택 후 되돌아와 상태 저장

출발/도착역이 같을 경우: 선택 제한 로직 포함 (다이얼로그)

출발/도착역 모두 선택 시: SeatPage로 이동

경고 다이얼로그 → CupertinoAlertDialog 사용, destructive/default action 차이 주석

🚉 stationpage.dart

StationPage: 역 리스트 화면 (StatelessWidget)

props: stationtitle(타이틀), excludeStation(중복 선택 방지)

ListView.builder: train_model.dart의 역 리스트 출력

onTap: 선택된 역 Navigator.pop으로 반환

💺 seatpage.dart

SeatPage: 출발/도착역 선택 완료 후 좌석 선택 페이지 (StatefulWidget)

상태: 선택된 좌석 추적

SeatLine: Seat 위젯 여러 개 Row로 배치, 선택 로직 포함

Seat: 좌석 선택 가능/불가능 상태 UI → 클릭 시 상태 변경

ReservationButton: 좌석 선택 완료 시 활성화, 예약 처리 또는 알림

주석에 선택 로직, setState 흐름, 조건부 UI 표현 상세 설명

🧩 widget/

SelectButton: 공통 선택 버튼, props: label, color, onPressed → 역할과 연결 주석 포함

Seat: 한 좌석 단위 UI, 선택 상태에 따라 색상/아이콘 변경, 클릭 시 상태 토글

SeatLine: Row로 좌석 배치, 반복 로직 주석

ReservationButton: 예약 조건 만족 시만 활성화, 클릭 시 처리 로직

🗂 train_model.dart

더미 데이터: KTX 역 리스트 등 정의, 데이터 흐름 주석 포함

📌 전체 흐름 요약

1️⃣ HomePage → 출발역 선택(StationPage) → 복귀
2️⃣ HomePage → 도착역 선택(StationPage) → 복귀
3️⃣ 출발/도착역 다 선택 → SeatPage 이동
4️⃣ SeatPage에서 좌석 선택 → ReservationButton 클릭 → 예약 완료
