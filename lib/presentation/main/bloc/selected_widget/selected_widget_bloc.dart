import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ui_builder/presentation/main/bloc/selected_widget/selected_widget_event.dart';
import 'package:mini_ui_builder/presentation/main/bloc/selected_widget/selected_widget_state.dart';

import '../../../../domain/model/text_editor_widget_item.dart';

// Bloc 클래스 정의 : SelectedWidget 관련 이벤트와 상태를 처리하는 Bloc 클래스
// 이벤트를 받아서 상태를 관리
class SelectedWidgetBloc extends Bloc<SelectedWidgetEvent, SelectedWidgetState> {

  //생성자 : 초기 상태를 SelectedWidgetInitial로 설정하고 이벤트 핸들러 등록
  SelectedWidgetBloc():super(SelectedWidgetInitial()){
    // SelectWidget 이벤트가 발생했을때 실행되는 콜백
   on<SelectWidget>((event, emit){
     // 이벤트에서 전달 받은 선택된 위젯 정보로 상태를 WidgetSelected로 변경
     emit(WidgetSelected(event.selectedItem));
   });

   // 텍스트 속성 변경 이벤트 발생 시, 선택된 위젯이 TextEditorWidgetItem이면 해당 텍스트만 변경된 새 상태로 emit
   on<UpdateTextProperty>((event, emit) {
     if (state is WidgetSelected && (state as WidgetSelected).selectedItem is TextEditorWidgetItem) {
       final item = (state as WidgetSelected).selectedItem as TextEditorWidgetItem;
       emit(WidgetSelected(
         item.copyWith(text: event.text),
       ));
     }
   });

   // 폰트 사이즈 속성 변경 이벤트 발생 시, 선택된 위젯에 따라 동작 TextEditorWidgetItem일경우 폰트사이즈만 변경된 새 상태로 emit
   on<UpdateFontSizeProperty>((event, emit) {
     if (state is WidgetSelected && (state as WidgetSelected).selectedItem is TextEditorWidgetItem) {
       final item = (state as WidgetSelected).selectedItem as TextEditorWidgetItem;
       emit(WidgetSelected(
         item.copyWith(fontSize: event.fontSize),
       ));
     }
   });

   // 색상 속성 변경 이벤트 발생 시, 선택된 위젯에 따라 동작
   on<UpdateColorProperty>((event, emit) {
     if (state is WidgetSelected && (state as WidgetSelected).selectedItem is TextEditorWidgetItem) {
       final item = (state as WidgetSelected).selectedItem as TextEditorWidgetItem;
       emit(WidgetSelected(
         item.copyWith(color: event.color),
       ));
     }
   });
  }
}