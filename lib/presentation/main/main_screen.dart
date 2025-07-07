import 'package:flutter/material.dart';
import 'package:mini_ui_builder/presentation/main/widget/widget_editor_view.dart';
import 'package:mini_ui_builder/presentation/main/widget/widget_property_panel.dart';
import 'package:mini_ui_builder/presentation/main/widget/widget_selector_panel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLeftPanelOpen = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isLeftPanelOpen
            ? const Expanded(
                flex: 2,
                child: WidgetSelectorPanel(),
              )
            : const SizedBox.shrink(), // null 대신 사용 위젯.

        // 왼쪽 Widget Selecotor 판넬을 표시,제거 할 수 있도록.
        GestureDetector(
          onTap: () {
            setState(() {
              isLeftPanelOpen = !isLeftPanelOpen;
            });
          },
          child: Container(
            color: Colors.grey[200],
            width: 24,
            alignment: Alignment.center,
            child: Icon(
              isLeftPanelOpen ? Icons.arrow_left : Icons.arrow_right,
            ),
          ),
        ),
        const Expanded(
          flex: 5,
          child: WidgetEditorView(),
        ),
        const Expanded(
          flex: 3,
          child: WidgetPropertyPanel(),
        ),
      ],
    );
  }
}
