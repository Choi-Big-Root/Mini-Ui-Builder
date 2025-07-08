import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ui_builder/presentation/main/widget/text_property_form.dart';

import '../../../domain/model/text_editor_widget_item.dart';
import '../bloc/selected_widget/selected_widget_bloc.dart';
import '../bloc/selected_widget/selected_widget_event.dart';
import '../bloc/selected_widget/selected_widget_state.dart';

class WidgetPropertyPanel extends StatefulWidget {
  const WidgetPropertyPanel({super.key});

  @override
  State<WidgetPropertyPanel> createState() => _WidgetPropertyPanelState();
}

class _WidgetPropertyPanelState extends State<WidgetPropertyPanel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedWidgetBloc, SelectedWidgetState>(
      // SelectedWidgetBloc의 상태가 변경될 때마다 빌드
      builder: (context, state) {
        // 현재 선택된 위젯이 있고, 그것이 텍스트 위젯인 경우
        if (state is WidgetSelected && state.selectedItem is TextEditorWidgetItem) {
          final textItem = state.selectedItem as TextEditorWidgetItem;

          // 텍스트 속성 편집 위젯 렌더링
          return TextPropertyForm(
            text: textItem.text,
            fontSize: textItem.fontSize,
            color: textItem.color,
            // 텍스트 변경 시 Bloc에 이벤트 전달
            onTextChanged: (value) {
              context.read<SelectedWidgetBloc>().add(UpdateTextProperty(value));
            },
            // 폰트사이즈 변경 시 Bloc에 이벤트 전달
            onFontSizeChanged: (value) {
              context.read<SelectedWidgetBloc>().add(UpdateFontSizeProperty(value));
            },
            // 색상 변경 시 Bloc에 이벤트 전달
            onColorChanged: (value) {
              context.read<SelectedWidgetBloc>().add(UpdateColorProperty(value));
            },
          );
        }
        // 위젯이 선택되지 않거나 텍스트 위젯이 아닌경우
        return Container(color: const Color(0xFF121212),child: const Center(child: Text('위젯을 선택하세요',style: TextStyle(color: Colors.white),)));
      },
    );
  }
}