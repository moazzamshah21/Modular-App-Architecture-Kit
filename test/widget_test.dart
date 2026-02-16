import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:modularapparchitecture/core/animations/animations.dart';

void main() {
  testWidgets('FadeIn builds and contains child', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FadeIn(
            delay: Duration.zero,
            duration: Duration(milliseconds: 1),
            child: Text('Animated'),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('Animated'), findsOneWidget);
  });
}
