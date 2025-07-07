// DTO 를 앱 내부에서 사용하기 좋게 변환한 구조,
// 앱의 비즈니스 로직이나 UI 레이어에서 직접 사용할 데이터 객체
// DTO 와의 차이점은 DTO는 서버 그대로를 담고, Model은 이 데이터를 실제 앱에서 사용하기 위한 형태로 변환한 객체. Mapper를 통해 DTO -> Model 변환
class SelectorWidgetModel {
  final String name;
  final String icon;

  SelectorWidgetModel({required this.name, required this.icon});
}