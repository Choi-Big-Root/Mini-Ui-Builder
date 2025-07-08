import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ui_builder/domain/usecase/fetch_selector_widget_list_usecase.dart';
import 'package:mini_ui_builder/presentation/main/bloc/widget_selector_event.dart';
import 'package:mini_ui_builder/presentation/main/bloc/widget_selector_state.dart';

// Bloc 클래스 정의 : WidgetSelectorEvent 이벤트를 받아 WidgetSelectorState 상태를 관리
class WidgetSelectorBloc extends Bloc<WidgetSelectorEvent,WidgetSelectorState> {

  // 위젯 리스트를 가져오는 UseCase[비즈니스 로직] 을 의존성 주입 받음
  final FetchSelectorWidgetListUseCase useCase;

  // 생성자 : 초기 상태를 WidgetSelectorInitial로 설정하고 이벤트 핸들러 등록
  WidgetSelectorBloc(this.useCase) : super(WidgetSelectorInitial()){
    // FetchWidgetSelectorList 이벤트가 발생하면 _onFetchWidgetSelectorList 함수 실행
    on<FetchWidgetSelectorList>(_onFetchWidgetSelectorList);
  }

  // FetchWidgetSelectorList 이벤트 처리 함수
  // 이벤트 수신 시 호출되며 상태 변경을 담당
  Future<void> _onFetchWidgetSelectorList( FetchWidgetSelectorList event, Emitter<WidgetSelectorState> emit) async {
    // 데이터를 가져오는 중임을 알리는 상태로 변경 -> UI에서 로딩 표시 가능
    emit(WidgetSelectorLoading());
    try {
      // UseCase 호출하여 실제 데이터[위젯 리스트]를 비동기로 가져온다.
      final widgets = await useCase();

      // 데이터를 성공적으로 받았으니 Loaded 상태로 변경하여 데이터 전달
      emit(WidgetSelectorLoaded(widgets));
    } catch (e) {
      // 에러 발생 시 Error 상태로 변경하며 에러 메시지 전달.
      emit(WidgetSelectorError(e.toString()));
    }
  }
}