// 위젯 선택 목록 관련 이벤트의 추상 클래스
abstract class WidgetSelectorEvent{}

// 위젯 목록을 가져오는 이벤트, Bloc는 이 이벤트를 감지하면 서버 또는 로컬에서 위젯 데이터를 가져오고 적절한 상태로 전환한다.
class FetchWidgetSelectorList extends WidgetSelectorEvent {}