import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ui_builder/domain/model/editor_widget_item.dart';
import 'package:mini_ui_builder/presentation/main/bloc/editor_view/editor_view_event.dart';
import 'package:mini_ui_builder/presentation/main/bloc/editor_view/editor_view_state.dart';

// EditorViewBloc는 중앙 에디터 영역의 상태를 관리.
class EditorViewBloc extends Bloc<EditorViewEvent,EditorViewState> {
  // 에디터에 배치된 위젯들의 내부 상태 리스트 : Bloc 내부에서만 사용
  final List<EditorWidgetItem> _items = [];

  // Bloc 생성자 : 초기 상태는 아무 위젯도 없는 EditorViewInitial
  EditorViewBloc() : super(EditorViewInitial()){
    // AddWidgetToEditor 이벤트를 수신하면 실행할 로직 등록
    on<AddWidgetToEditor>((event, emit){
      // 전달 받은 위젯과 위치 정보를 이용해 새로운 아이템을 생성 후 리스트에 추가
      _items.add(EditorWidgetItem(widget: event.widget, position: event.position));

      // 상태를 변경하면서 리스트 복사본을 전달
      // _items 를 직접 전달하지 않는 이유는 외부에서 참조하지 못하도록 불변성을 지키기 위해. 복사본을 전달한다.
      emit(EditorViewUpdated(List.from(_items)));
    });
  }
}