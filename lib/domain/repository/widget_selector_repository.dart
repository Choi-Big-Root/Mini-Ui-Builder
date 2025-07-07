import 'package:mini_ui_builder/domain/model/selector_widget_model.dart';

// 위젯 목록을 불러오기 위한 추상 리포지토리 정의
abstract class WidgetSelectorRepository {
  // 위젯 선택 화면에서 사용할 위젯 목록을 불러오며, 실제 구현에서는 서버 API, 로컬 JSON, DB등 다양한 방식이 될 수 있다.
  Future<List<SelectorWidgetModel>> getWidgetList();
}