import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/selector_widget_dto.dart';

// 외부 API 서버로부터 SelectorWidgetDto 리스트를 가져오는 데이터 소스 클래스
class WidgetSelectorRemoteDataSource {
  // 서버에서 위젯 리스트를 가져오는 비동기 함수
  Future<List<SelectorWidgetDto>> fetchWidgetList() async {
    //http.get 을 통해 localhost 의 selector_widget_list 엔드포인트에 요청
    final response = await http.get(Uri.parse('http://localhost:8080/selector_widget_list'));

    // 응답 성공 (200 OK)
    if (response.statusCode == 200) {
      // 응답 body = json 문자열 을 디코딩 하여 List<dynamic> 형태로 파싱
      final List<dynamic> data = jsonDecode(response.body);
      // 각 JSON 객체를 SelectorWidgetDto로 변환하여 리스트로 반환.
      return data.map((e) => SelectorWidgetDto.fromJson(e)).toList();
    } else {
      throw Exception('위젯 리스트를 가져오는데 실패.');
    }
  }
}