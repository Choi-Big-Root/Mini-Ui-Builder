
import '../../../../domain/model/editor_widget_item.dart';
// 선택된 위젯 상태를 정의하는 추상 클래스
abstract class SelectedWidgetState {}
// Bloc 초기상태
class SelectedWidgetInitial extends SelectedWidgetState{}
// 특정 위젯이 선택된 상태를 나타내는 클래스, 선택된 위젯의 데이터를 담아 ui에서 해당 위젯의 속성을 표시하도록 한다.
class WidgetSelected extends SelectedWidgetState {
  final EditorWidgetItem selectedItem;
  WidgetSelected(this.selectedItem);
}