import 'package:mini_ui_builder/data/mapper/selector_widget_mapper.dart';
import 'package:mini_ui_builder/data/source/widget_selector_remote_data_source.dart';
import 'package:mini_ui_builder/domain/model/selector_widget_model.dart';
import 'package:mini_ui_builder/domain/repository/widget_selector_repository.dart';

// WidgetSelectorRepository 인터페이스를 구현할 실제 구현 클래스
class WidgetSelectorRepositoryImpl implements WidgetSelectorRepository {

  // 실제 데이터를 가져오는 역할을 하는 RemoteDataSource 의존성 주입
  final WidgetSelectorRemoteDataSource remoteDataSource;

  // 생성자 에서 RemoteDataSource를 받아 초기화
  WidgetSelectorRepositoryImpl(this.remoteDataSource);

  // 인터페이스에서 정의한 메서드 구현
  @override
  Future<List<SelectorWidgetModel>> getWidgetList() async {
    // RemoteDataSource를 통해 서버에서 DTO 리스트를 받아온다.
    final dtoList = await remoteDataSource.fetchWidgetList();

    // 받은 DTO 리스트를 앱 내부에서 사용할 Model 리스트로 변환 후 반환
    return dtoList.map((dto)=> dto.toModel()).toList();
  }

}