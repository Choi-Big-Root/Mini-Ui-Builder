import 'package:mini_ui_builder/domain/model/editor_widget_item.dart';

// EditorView의 상태를 정의하는 추상 클래스
abstract class EditorViewState {}

// 초기 상태를 나타내는 클래스
class EditorViewInitial extends EditorViewState{}

// 에디터에 그려질 위젯 리스트가 업데이트된 상태를 나타낸다.
class EditorViewUpdate extends EditorViewState {
  // 현재 에디터에 배치된 위젯들의 리스트
  final List<EditorWidgetItem> items;
  // 생성자에서 위젯 리스트를 전달받은 상태로 유지.
  EditorViewUpdate(this.items);
}