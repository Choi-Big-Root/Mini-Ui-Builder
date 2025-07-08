import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/selected_widget/selected_widget_event.dart';
import 'package:mini_ui_builder/presentation/main/bloc/selected_widget/selected_widget_state.dart';

// Bloc 클래스 정의 : SelectedWidget 관련 이벤트와 상태를 처리하는 Bloc 클래스
// 이벤트를 받아서 상태를 관리
class SelectedWidgetBloc extends Bloc<SelectedWidgetEvent, SelectedWidgetState> {

  //생성자 : 초기 상태를 SelectedWidgetInitial로 설정하고 이벤트 핸들러 등록
  SelectedWidgetBloc():super(SelectedWidgetInitial()){
    // SelectWidget 이벤트가 발생했을때 실행되는 콜백
   on<SelectWidget>((event, emit){
     // 이벤트에서 전달 받은 선택된 위젯 정보로 상태를 WidgetSelected로 변경
     emit(WidgetSelected(event.widget));
   });
  }
}