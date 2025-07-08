# Mini UI Builder


Flutter 기반의 드래그 앤 드롭 UI 빌더 웹 애플리케이션입니다. <br/>
Dart의 `shelf` 패키지를 활용한 내장 테스트용 REST API 서버를 포함하고 있어  <br/>
**UI 구성 + API 연동 + 클라이언트-서버 구조 학습**을 한 번에 하기 위한 프로젝트 입니다. <br/><br/>

20250707 ~ 20250708 01시 05분 진행 상황.<br/>
UI 기본 구조 생성 및 shelf 패키지 사용해 RestAPI 연동 구현 테스트 완료.<br/>
- 이후 해야 할 것 간략 정리 : repository 구현체 작성 및 bloc 생성 및 적용 , dto+model freezed 패키지 사용하여 변경.<br/><br/>

20250708 ~ 20250708 17시 00분 진행 상황 <br/>
* image
![image](https://github.com/user-attachments/assets/36e153d1-5c11-4f77-b8b8-6e5304ae4a92)
* Bloc 구조 개선
 1. 위젯 선택 및 선택된 위젯 정보를 관리하는 Bloc 로직 구현
 2. 기존에는 Row 위젯 내부에 BlocProvider를 직접 배치했으나, 이는 UI 로직과 상태 관리를 분리하지 못하는 구조임을 확인
 3. MultiBlocProvider를 상위로 분리하여 전체 구조를 개선

* Shelf 서버 CORS 에러 해결
 1. Shelf 패키지를 활용해 API 서버 구성 중, 브라우저 콘솔에 ClientException: Failed to fetch 오류 발생
 2. 원인은 브라우저의 CORS 보안 정책(다른 Origin 간 요청 차단)으로 확인
 3. 해결 방법으로 shelf_cors_headers 패키지를 도입하고, 서버 미들웨어에 CORS 허용 헤더(Access-Control-Allow-Origin) 추가하여 정상 통신 확인

* 드래그 기능 테스트
 1. Draggable과 DragTarget 기본 적용 및 이벤트 흐름 테스트 완료
 2. 선택된 위젯을 드래그하여 다른 영역으로 전달하는 로직 기초 구현
   
* 예정작업(07.08 오후 ~ 새벽 진행 예정)
 1. 중앙 EditorView 영역에 선택된 위젯 실제 표시
 2. 오른쪽 WidgetPropertyPanel 영역 마무리 (선택된 위젯 속성 수정)
 3. 중앙 EditorView 내 위젯 위치·크기 조정 기능 구현 : 마우스 드래그로 넓이, 높이, 위치 변경 가능하도록 설계 예정
     
* 아쉬운점은.. 지금까지 구현하며 가장 아쉬웠던 점은 세세한 UI/UX 디테일을 충분히 챙기지 못하고 있다는 생각이 너무 든다.. 시간적 여유가 없다는 생각이 하.. 미치겠다
* 눈의 피로도 심해져 잠시 2시간 정도 휴식 후, 새벽까지 남은 작업을 진행할 예정입니다.
