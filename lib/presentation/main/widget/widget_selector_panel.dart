import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/selected_widget/selected_widget_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/selected_widget/selected_widget_event.dart';
import 'package:mini_ui_builder/presentation/main/bloc/widget_selector/widget_selector_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/widget_selector/widget_selector_state.dart';

class WidgetSelectorPanel extends StatefulWidget {
  const WidgetSelectorPanel({super.key});

  @override
  State<WidgetSelectorPanel> createState() => _WidgetSelectorPanelState();
}

class _WidgetSelectorPanelState extends State<WidgetSelectorPanel> {
  int? selectedIndex; // 선택된 카드의 인덱스를 저장하기 위한 변수 : default는 아무런 값을 선택하고 있지않을 테니 null 일 수도 있다.

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
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: const Color(0xFF121212),
            child: Center(
              // 전체 GrideView 중앙 배치
              child: GridView.builder(
                shrinkWrap: true,
                // 자식 크기만큼의 높이를 가지도록 설정 해당 설정이 없으면 전체크기를 다 잡기에 Center가 의미 없다.
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: widgetList.length,
                itemBuilder: (context, index) {
                  final item = widgetList[index];
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      context.read<SelectedWidgetBloc>().add(SelectWidget(item));
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Card(
                      color: isSelected? const Color(0xFF633BEB) : const Color(0xFF222222),
                      child: Draggable( //처음 사용해보는 위젯 정리 필요.
                        //드래그 시 전달할 데이터 객체
                        data: item,
                        // 드래그 중에 따라다니는 '피드백' UI : *피드백이란 사용자가 드래그 동작을 할때, 커서를 따라다니며 보여주는 시각적 UI를 의미.
                        feedback: Material(
                          //배경 투명
                          color: Colors.transparent,
                          child: Card(
                            //드래그 중 보여질 Card의 배경색
                            color: const Color(0xFF633BEB),
                            // 드래그 피드백 사이즈 지정.
                            child: SizedBox(
                              width: 80,
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(item.icon),
                                  Text(
                                    item.name,
                                    style: const TextStyle(color: Color(0xFFC1C1C1)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // 드래그 중에 보여지 기존 위젯 투명도 설정
                        childWhenDragging: Opacity(
                          opacity: 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item.icon),
                              Text(
                                item.name,
                                style: const TextStyle(color: Color(0xFFC1C1C1)),
                              ),
                            ],
                          ),
                        ),
                        //드래그 하지 않을때 보여질 위젯 설정.
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item.icon),
                            Text(
                              item.name,
                              style: const TextStyle(color: Color(0xFFC1C1C1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
