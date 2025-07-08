import 'package:mini_ui_builder/domain/model/selector_widget_model.dart';

// 선택한 위젯의 정보 관련 이벤트의 추상 클래스
abstract class SelectedWidgetEvent{}

// 사용자가 특정 위젯을 선택 했을때 발생하는 이벤트, 선택된 위젯의 정보를 담고 초기화.
class SelectWidget extends SelectedWidgetEvent {
  final SelectorWidgetModel widget;
  SelectWidget(this.widget);
}