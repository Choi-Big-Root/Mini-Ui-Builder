// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_ui_builder/data/dto/selector_widget_dto.dart';
import 'package:mini_ui_builder/data/source/widget_selector_remote_data_source.dart';

import 'package:mini_ui_builder/main.dart';

void main() {
  test('fetchWidgetList returns a list of SelectorWidgetDto', () async {
    final dataSource = WidgetSelectorRemoteDataSource();

    final result = await dataSource.fetchWidgetList();

    expect(result, isA<List<SelectorWidgetDto>>());
    expect(result.isNotEmpty, true); // 실제 데이터가 있다고 가정
    expect(result.first.name, isNotEmpty); // DTO 내부 값 확인

    print(result.toString());
  });
}
