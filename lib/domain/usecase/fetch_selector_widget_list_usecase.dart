import 'package:mini_ui_builder/domain/model/selector_widget_model.dart';
import 'package:mini_ui_builder/domain/repository/widget_selector_repository.dart';

// 위젯 리스트를 가져오는 동작 을 담다하는 유스케이스 클래스
class FetchSelectorWidgetListUseCase {
  // 데이터 소스를 주입받기 위한 Repository 선언
  final WidgetSelectorRepository repository;

  // 생성자에서 Repository를 주입 받는다 DI
  FetchSelectorWidgetListUseCase(this.repository);

  // 실제로 위젯 리스트를 불러오는 비즈니스 로직 메서드
  Future<List<SelectorWidgetModel>> call() {
    // Repository 를 통해 위젯 리스트를 받아 온다.
    return repository.getWidgetList();
  }
}