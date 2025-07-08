import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/selected_widget/selected_widget_bloc.dart';
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
      builder: (context, state) {
        if (state is WidgetSelected) {
          final widget = state.widget;
          // widget.name에 따라 폼 분기 우선 대기 일단 editor view 단 먼저 해결.
          if (widget.name == 'Text') {
            return Center(child: Text(widget.name));
          }
        }
        return const Center(child: Text('위젯을 선택하세요'));
      },
    );
  }
}
