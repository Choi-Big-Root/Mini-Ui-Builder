/// API 응답을 다루기 위해 사용 하는 객체 단순한 데이터 필드만 가지며 서버에서 내려주는 파라미터 그대로 작성을 해야 한다.
class SelectorWidgetDto {
  final String name;
  final String icon;

  SelectorWidgetDto({required this.name, required this.icon});

  // JSON -> DTO 객체로 변환
  factory SelectorWidgetDto.fromJson(Map<String, dynamic> json) {
    return SelectorWidgetDto(
      name: json['name'] as String,
      icon: json['icon'] as String,
    );
  }

  // DTO 객체 -> JSON으로 변환
  Map<String, dynamic> toJson() {
    return {'name': name, 'icon': icon};
  }
}
