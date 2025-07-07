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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Stack(
            children: [
              WidgetSelectorPanel(),
              Positioned(
                top: 5,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.grey[200],
                    width: 24,
                    child: Icon(Icons.arrow_left),
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(flex: 3, child: WidgetEditorView()),
        Expanded(flex: 1, child: WidgetPropertyPanel()),
      ],
    );
  }
}
