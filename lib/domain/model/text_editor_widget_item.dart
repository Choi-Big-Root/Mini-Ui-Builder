import 'dart:ui';

import 'package:mini_ui_builder/domain/model/editor_widget_item.dart';

class TextEditorWidgetItem extends EditorWidgetItem {
  final String text;
  final double fontSize;
  final Color color;

  TextEditorWidgetItem({
    required super.widget,
    required super.position,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  TextEditorWidgetItem copyWith({
    String? text,
    double? fontSize,
    Color? color,
    Offset? position,
  }) {
    return TextEditorWidgetItem(
      widget: widget,
      position: position ?? this.position,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
      color: color ?? this.color,
    );
  }
}