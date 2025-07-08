import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ui_builder/domain/model/editor_widget_item.dart';
import 'package:mini_ui_builder/presentation/main/bloc/editor_view/editor_view_event.dart';
import 'package:mini_ui_builder/presentation/main/bloc/editor_view/editor_view_state.dart';

import '../../../../domain/model/text_editor_widget_item.dart';

// EditorViewBloc는 중앙 에디터 영역의 상태를 관리.
class EditorViewBloc extends Bloc<EditorViewEvent,EditorViewState> {
  // 에디터에 배치된 위젯들의 내부 상태 리스트 : Bloc 내부에서만 사용
  final List<EditorWidgetItem> _items = [];

  // Bloc 생성자 : 초기 상태는 아무 위젯도 없는 EditorViewInitial
  EditorViewBloc() : super(EditorViewInitial()){
    // AddWidgetToEditor 이벤트를 수신하면 실행할 로직 등록
    on<AddWidgetToEditor>((event, emit){
      final item = event.item;

      // 드롭된 위젯이 TextEditorWidgetItem 이면 position만 변경하여 새 인스턴스 생성 이미 생성되어 있는 postion 이 변경되선 안되기에
      EditorWidgetItem itemWithPosition;
      if (item is TextEditorWidgetItem) {
        // copyWith 을 사용하여 불변 객체 패턴 유지
        itemWithPosition = item.copyWith(position: event.position);
      } else {
        // 분기 처리 되지 않은 위젯 처리.
        throw UnimplementedError('지원하지 않는 위젯 타입입니다.');
      }
      // 내부 리스트에 새 아이템 추가
      _items.add(itemWithPosition);

      // 새로운 상태를 emit: List.from 사용으로 외부에서 리스트 변경 불가하도록 복사
      emit(EditorViewUpdated(List.from(_items)));
    });
  }
}