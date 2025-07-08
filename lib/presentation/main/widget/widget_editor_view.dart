import 'package:flutter/material.dart';

import '../../../domain/model/selector_widget_model.dart';

class WidgetEditorView extends StatelessWidget {
  const WidgetEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return DragTarget<SelectorWidgetModel>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          height: 200,
          width: 200,
          color: candidateData.isNotEmpty ? Colors.blue.withOpacity(0.5) : Colors.grey[300],
        );
      },

      onAcceptWithDetails: (data) {
        print(data.data.name);
      },
      onLeave: (data) {
        print('onLeave Test');
      },
    );

  }
}
