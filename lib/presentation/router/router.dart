import 'package:go_router/go_router.dart';
import 'package:mini_ui_builder/presentation/main/main_screen.dart';
import 'package:mini_ui_builder/presentation/router/router_path.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterPath.main, // '/'
      name: 'main',
      builder: (context, state) => MainScreen(),
    ),
  ],
  initialLocation: '/'
);
