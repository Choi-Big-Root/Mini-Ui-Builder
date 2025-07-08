import 'dart:ui';

import 'package:mini_ui_builder/domain/model/selector_widget_model.dart';

import '../../../../domain/model/editor_widget_item.dart';

// 선택한 위젯의 정보 관련 이벤트의 추상 클래스
abstract class SelectedWidgetEvent{}

// 사용자가 특정 위젯을 선택 했을때 발생하는 이벤트, 선택된 위젯의 정보를 담고 초기화.
class SelectWidget extends SelectedWidgetEvent {
  final EditorWidgetItem selectedItem;
  SelectWidget(this.selectedItem);
}
// 사용자가 텍스트 속성을 변경 했을때 발생하는 이벤트, 변경된 텍스트 값을 상태에 반영하기 위해 전달
class UpdateTextProperty extends SelectedWidgetEvent {
  final String text;
  UpdateTextProperty(this.text);
}
// 사용자가 폰트사이즈 속성을 변경 했을때 발생하는 이벤트, 변경된 폰트사이즈 값을 상태에 반영하기 위해 전달
class UpdateFontSizeProperty extends SelectedWidgetEvent {
  final double fontSize;
  UpdateFontSizeProperty(this.fontSize);
}

// 사용자가 색상 속성을 변경 했을때 발생하는 이벤트, 변경된 색상 값을 상태에 반영하기 위해 전달
class UpdateColorProperty extends SelectedWidgetEvent {
  final Color color;
  UpdateColorProperty(this.color);
}