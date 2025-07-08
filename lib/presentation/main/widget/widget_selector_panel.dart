import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/widget_selector_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/widget_selector_state.dart';

class WidgetSelectorPanel extends StatelessWidget {
  const WidgetSelectorPanel({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocBuilder : Bloc 상태가 변경될때 마다 builder 함수가 호출 되어 ui fmf ektl rmflsek.
    return BlocBuilder<WidgetSelectorBloc, WidgetSelectorState>(
      builder: (context, state) {
        // 상태가 로딩 중일때
        if (state is WidgetSelectorLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        // 상태가 에러일 경우
        if (state is WidgetSelectorError) {
          print(state.message);
          return Center(child: Text('에러: ${state.message}'));
        }

        // 상태가 데이터 로드 완료일 경우
        if (state is WidgetSelectorLoaded) {
          final widgetList = state.widgetList;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: widgetList.length,
            itemBuilder: (context, index) {
              final item = widgetList[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(item.icon), Text(item.name)],
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
