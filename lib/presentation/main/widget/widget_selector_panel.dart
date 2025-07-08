import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ui_builder/domain/model/editor_widget_item.dart';
import 'package:mini_ui_builder/presentation/main/bloc/selected_widget/selected_widget_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/selected_widget/selected_widget_event.dart';
import 'package:mini_ui_builder/presentation/main/bloc/widget_selector/widget_selector_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/widget_selector/widget_selector_state.dart';

import '../../../domain/model/text_editor_widget_item.dart';
import '../bloc/selected_widget/selected_widget_state.dart';

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
                      EditorWidgetItem editorWidgetItem;
                      if(item.name == 'Text'){
                        editorWidgetItem = TextEditorWidgetItem(
                          widget: item,
                          position: Offset.zero,
                          text: '텍스트',
                          fontSize: 20,
                          color: Colors.black,
                        );
                      }else{
                        //일단 테스트를 위해 대기.
                        editorWidgetItem = TextEditorWidgetItem(
                          widget: item,
                          position: Offset.zero,
                          text: '텍스트',
                          fontSize: 20,
                          color: Colors.black,
                        );
                      }

                      context.read<SelectedWidgetBloc>().add(SelectWidget(editorWidgetItem));
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: BlocBuilder<SelectedWidgetBloc, SelectedWidgetState>(
                      builder: (context, selectedState) {
                        return Card(
                          color: isSelected ? const Color(0xFF633BEB) : const Color(0xFF222222),
                          child: Draggable<EditorWidgetItem>( // 처음 사용해 보는 위젯 정리 필요.
                            // 드래그 시 전달할 데이터 객체: 항상 최신 설정값(selectedItem)
                            data: (selectedState is WidgetSelected)
                                ? selectedState.selectedItem
                                : TextEditorWidgetItem(
                                    widget: item,
                                    position: Offset.zero,
                                    text: '텍스트',
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                            //드래그 중에 따라다니는 '피드백' UI : *피드백이란 사용자가 드래그 동작을 할때, 커서를 따라다니며 보여주는 시각적 UI를 의미.
                            feedback: Material(
                              //배경 투명
                              color: Colors.transparent,
                              // 드래그 중 보여질 Card 위젯
                              child: Card(
                                color: const Color(0xFF633BEB),
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
                            // 드래그 중에 보여질 기존 위젯 설정.
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
                            // 드래그 하지 않았을때 보여질 위젯 설정.
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
                        );
                      },
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
