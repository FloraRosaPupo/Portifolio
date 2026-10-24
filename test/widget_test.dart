import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/main.dart';

void main() {
  testWidgets('portfolio starts without external services', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('Desenvolvedora AI-first'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
