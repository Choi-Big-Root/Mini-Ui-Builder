import 'package:flutter/material.dart';
import 'package:mini_ui_builder/domain/model/selector_widget_model.dart';

class EditorWidgetItem {
  final SelectorWidgetModel widget; // 추가된 위젯 정보
  final Offset position; // 위치

  EditorWidgetItem({required this.widget, required this.position});
}