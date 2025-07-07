import 'package:mini_ui_builder_server/handler/selector_widget_handler.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

// Shelf 서버를 실행하는 진입점 비동기 실행을 위해 async 사용
void main() async {
  // Router 인스턴스를 생성하여 엔드포인트 경로 관리
  // 여러 HTTP 경로에 따라 적절한 handler 등록 할 수 있다.
  final router = Router();

  // get 요청으로 /selector_widget_list 경로가 들어오면 selectorWidgetHandler 함수 실행.
  router.get('/selector_widget_list', selectorWidgetHandler);

  // 중간단계 미들웨어로 요청 로그 출력 후 실제 요청 처리 함수 실행 = router.call
  final handler = const Pipeline().addMiddleware(logRequests()).addHandler(router.call);

  // shelf 서버를 localhost:8080 포트에 바인딩 하여 시작. 비동기 임으로 await 사용.
  final server = await io.serve(handler, 'localhost', 8080);
  print('서버 실행중: http://${server.address.host}:${server.port}'); // print 는 꼭 추후에 삭제 해야한다. 메모리에 계속 떠 있기 때문.
}