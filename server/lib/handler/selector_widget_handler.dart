import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../data/selector_widget_data.dart';


//Request 를 받아서 JSON Response를 반환 하는 함수.
Response selectorWidgetHandler(Request request) {
  // 응답으로 HTTP 200 OK를 반환하면서
  return Response.ok(
    // seletorWidgetList 객체를 JSON 문자열로 인코딩
    jsonEncode(selectorWidgetList),
    // 응답 헤더에 Content-Type을 JSON으로 명시.
    // 웹 브라우저나 클라이언트가 해당 읍답을 JSON으로 인식하게 된다.
    headers: {'Content-Type': 'application/json'},
  );
}