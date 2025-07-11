# Mini UI Builder


Flutter 기반의 드래그 앤 드롭 UI 빌더 웹 애플리케이션입니다. <br/>
Dart의 `shelf` 패키지를 활용한 내장 테스트용 REST API 서버를 포함하고 있어  <br/>
**UI 구성 + API 연동 + 클라이언트-서버 구조 학습**을 한 번에 하기 위한 프로젝트 입니다. <br/><br/>

20250707 ~ 20250708 01시 05분 진행 상황.<br/>
UI 기본 구조 생성 및 shelf 패키지 사용해 RestAPI 연동 구현 테스트 완료.<br/>
- 이후 해야 할 것 간략 정리 : repository 구현체 작성 및 bloc 생성 및 적용 , dto+model freezed 패키지 사용하여 변경.<br/><br/>

<br/><hr/><br/>

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

<br/><hr/><br/>

20250708 ~ 20250709 00시 35분 진행 상황 <br/>
![project](https://github.com/user-attachments/assets/9b0ac438-ec16-4048-9f96-ed9d8db2fbff)

* 선택된 위젯의 속성(텍스트, 폰트 크기, 색상 등)을 실시간으로 수정할 수 있는 폼(TextPropertyForm) 구현
* Bloc(SelectedWidgetBloc)과 연동하여, 속성 값이 변경될 때마다 상태가 즉시 갱신되도록 개선 : 해당 부부은 Text 변경시에 계속 갱신되다 보니 입력이 매우 불편한점이 존재하여 수정 예정
* 속성 폼에서 입력/선택한 값이 Bloc 상태(selectedItem)에 반영
* Draggable의 data에 항상 SelectedWidgetBloc의 최신 selectedItem(설정값 반영된 EditorWidgetItem)을 넘기도록 BlocBuilder 중첩 구조로 개선
* onAcceptWithDetails에서 받은 item의 position만 드롭 위치로 변경하여 EditorViewBloc에 추가

* 개선 및 추가 해야하는 내용
1. 이제 TextWidget 하나 완료한거고 기본 틀은 동일할테니 다른 위젯도 추가 필요
2. Text 위젯의 경우, 텍스트 입력 시마다 Bloc 이벤트로 인해 상태가 과도하게 갱신되어 입력이 불편한 문제가 있어 개선이 필요하다.. onChnage 에 걸지말고 focusout이나 따로 완료 버튼을 만들던지 해야겠다..
3. Flutter를 많이 다뤄보지 않아서 인지 설계를 미리 짜놓고 한게 아니라 박으면서 해가지고 그런건지.. 잘되다가도 하나 막히면 아예 싹다 엎어야 하는 경우가 생기다 보니 시간 압박때문에 공통으로 사용되는 로직 분리도 안되어 있고 클린아키텍처도 많이 망가져 버린것 같아 수정이 필요..
4. 다른 위젯들도 추가가 되면 이제 editor_view에서 마우스를 사용하여 위젯의 크기를 조절 할 수 있도록 하는 기능과 editor_view에서 위젯을 선택할시 해당 위젯의 속성을 다시 정의하고 위젯의 크기를 외각선으로 보여줄 수 있도록 하는 작업을 추가.

* 느낀점
- 어렵다..배워야 하는게 산더미고 디테일 다포기해도 4시간동안 이거 하나 한거라니.. 2일뒤가 면접인데 망한거 같다.

<br/><hr/><br/>

~~해당 프로젝트는 2025-07-10일 이후에 다시 진행할 겁니다.  
원래는 면접 때 뭐라도 보여드리고자 그때까지만 하려고 했으나,  
오기가 생겨서 일단 만드는 건 면접 결과에 상관 없이 끝까지 해볼 생각입니다.  
2025-07-09일은 따로 면접 준비 및 정리해야 할 내용이 있어 업데이트되지 않습니다.~~

<br/><hr/><br/>
기존 작성중이던 프로젝트들을 먼저 마무리할 예정이며 <br/>
해당 프로젝트는 멈추는게 아닌 꾸준히 천천히 작업을 진행할 예정입니다. 상세 내용은 메인의 Read.me 를 참고 바랍니다.감사합니다<br/> 

