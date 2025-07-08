import 'package:mini_ui_builder/domain/model/selector_widget_model.dart';

// 위젯 선택 관련 Bloc 상태의 추상 클래스
// 모든 상태 클래스는 이 클래스를 상속 받아야 한다.
abstract class WidgetSelectorState {}

// Bloc이 초기 상태일 때(아무 작업도 수행되지 않은 상태)
class WidgetSelectorInitial extends WidgetSelectorState {}

// Bloc이 데이터를 불러오는 중일 때의 상태
// 주로 로딩 스피너나 프로그래스 인디케이터를 UI에 표시
class WidgetSelectorLoading extends WidgetSelectorState {}

// Bloc이 데이터를 성공적으로 불러온 상태
// [widgetList] 에는 서버 또는 로컬에서 받아온 위젯 모델 리스트가 담겨 있다.
class WidgetSelectorLoaded extends WidgetSelectorState {
  final List<SelectorWidgetModel> widgetList;
  // 상태 생성자에서 위젯 리스트를 전달받음
  WidgetSelectorLoaded(this.widgetList);
}

// Bloc이 데이터를 불러오는데 실패 했을 때의 상태
// [message]에는 에러 메시지가 담겨 있어 UI에 표시 가능하다.
class WidgetSelectorError extends WidgetSelectorState {
  final String message;
  // 상태 생성자에서 에러 메시지를 전달 받음.
  WidgetSelectorError(this.message);
}