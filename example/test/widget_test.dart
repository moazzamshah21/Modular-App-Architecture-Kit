// Basic Flutter widget smoke test for the Modular App Architecture example.

import 'package:flutter_test/flutter_test.dart';

import 'package:modularapparchitecture_example/main.dart';

void main() {
  testWidgets('Example app builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const ExampleApp());
    await tester.pumpAndSettle();
    expect(find.byType(ExampleApp), findsOneWidget);
  });
}
