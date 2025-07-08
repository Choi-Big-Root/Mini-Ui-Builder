import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ui_builder/data/repository/widget_selector_repository_impl.dart';
import 'package:mini_ui_builder/data/source/widget_selector_remote_data_source.dart';
import 'package:mini_ui_builder/domain/usecase/fetch_selector_widget_list_usecase.dart';
import 'package:mini_ui_builder/presentation/main/bloc/selected_widget/selected_widget_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/widget_selector/widget_selector_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/widget_selector/widget_selector_event.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WidgetSelectorBloc(
            FetchSelectorWidgetListUseCase(
              // 2: 실제 데이터를 가져올 데이터 소스 구현체 주입
              WidgetSelectorRepositoryImpl(WidgetSelectorRemoteDataSource()),
            ),
            // 3: 생성 직후 '위젯 리스트 가져오기' 이벤트를 디스패치
          )..add(FetchWidgetSelectorList()),
        ),

        BlocProvider(create: (context) => SelectedWidgetBloc()),
      ],
      child: Row(
        children: [
          isLeftPanelOpen
              ? const Expanded(flex: 2, child: WidgetSelectorPanel())
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
          const Expanded(flex: 5, child: WidgetEditorView()),
          const Expanded(flex: 3, child: WidgetPropertyPanel()),
        ],
      ),
    );
  }
}
