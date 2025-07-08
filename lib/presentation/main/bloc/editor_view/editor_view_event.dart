import 'package:flutter/material.dart';
import 'package:mini_ui_builder/domain/model/selector_widget_model.dart';

// 드래그로 그려지는 editor view 이벤트의 추상 클래스
abstract class EditorViewEvent {}

// editor view에 위젯이 추가하는 이벤트, Bloc는 이 이벤트를 감지하면 로컬에서 위젯 데이터와 위치를 가져오고 그려준다.
class AddWidgetToEditor extends EditorViewEvent {
  final SelectorWidgetModel widget;
  final Offset position;

  AddWidgetToEditor(this.widget, this.position);
}