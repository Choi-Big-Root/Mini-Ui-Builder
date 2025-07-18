import 'package:flutter/material.dart';
import 'package:mini_ui_builder/presentation/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
     routerConfig: router,
    );
  }
}
