import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/model/selector_widget_model.dart';
import '../bloc/editor_view/editor_view_bloc.dart';
import '../bloc/editor_view/editor_view_event.dart';
import '../bloc/editor_view/editor_view_state.dart';

class WidgetEditorView extends StatefulWidget {
  const WidgetEditorView({super.key});

  @override
  State<WidgetEditorView> createState() => _WidgetEditorViewState();
}

class _WidgetEditorViewState extends State<WidgetEditorView> {
  @override
  Widget build(BuildContext context) {
    // EditorViewBloc의 상태 변화를 감지하고 UI를 리빌드
    return BlocBuilder<EditorViewBloc, EditorViewState>(
      builder: (context, state) {
        // 에디터에 배치된 위젯 목록을 담을 리스트
        List items = [];
        if (state is EditorViewUpdated) {
          items = state.items; // 업데이트 된 상태일 경우 위젯 리스트를 저장.
        }
        // 현재 위젯의 레이아웃 정보를 제공 받아 하위 위젯의 크기 등을 결정.
        return LayoutBuilder(
          builder: (context, constraints) {
            // SelectorWidgetModel 타입의 드래그 타겟 선언 : Draggable 의 데이터를 사용하기 위해.
            return DragTarget<SelectorWidgetModel>(
              //details 의 주요 속성은 data,offset,wasAccepted 존재
              //data : 드개그된 위젯 데이터 자체
              //offset : 드래그된 위치 [스크린 전체 기준 좌표]
              //wasAccepted : 드롭이 실제 수락되었는지 여부 bool 타입.
              onAcceptWithDetails: (details) {
                // 드래그가 완료된 위치 정보를 EditorView 내부 좌표로 변환
                // context.findRenderObject() : BuildContext 로부터 현재 위젯이 렌더링 되는 RenderObject를 가져온다. = DragTarget이 위치한 영역의 화면 상 정보를 가져온다.
                // global(전체 화면) 좌표 → 위젯 내부(local) 좌표로 변환
                final RenderBox box = context.findRenderObject() as RenderBox;
                final localOffset = box.globalToLocal(details.offset);

                //변환된 좌표와 위젯 데이터를 Bloc 이벤트로 전달
                context.read<EditorViewBloc>().add(
                  AddWidgetToEditor(details.data, localOffset),
                );
              },
              builder: (context, candidateData, rejectedData) {
                return Stack( // 위젯들을 겹쳐서 배치할 수 있도록 하는 Stack 레이아웃
                  children: [
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    ...items.map<Widget>((item) {
                      // 아이템 리스트를 순회하며 각각의 위젯을 화면에 표시
                      return Positioned(
                        left: item.position.dx, // 위젯의 X좌표값
                        top: item.position.dy,  // 위젯의 Y좌표값
                        child: Card(
                          color: Colors.amber[100],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.widget.name),
                          ),
                        ),
                      );
                    }),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}