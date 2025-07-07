import 'package:mini_ui_builder/data/dto/selector_widget_dto.dart';
import 'package:mini_ui_builder/domain/model/selector_widget_model.dart';

// DTO 타입에 대해 확장을 정의 한다.
// 즉, 기존 Dto 클래스에 새로운 기능[toModel]을 추가
extension SelectorWidgetDtoMapper on SelectorWidgetDto {

  // dto 인스턴스를 model 인스턴스로 변환하는 메서드
  SelectorWidgetModel toModel() {
    // dto 객체의 name, icon 값을 이용해 model 객체를 생성하고 반환
    // 현재는 dto 값 그대로 전달 하였지만 해당 영역에서 가공을 할 수도 있다. 예를들어 name ?? '이릉없음' 처럼 데이터 가공이 가능.
    return SelectorWidgetModel(name: name, icon: icon);
  }
}