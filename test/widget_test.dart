import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/pages/sobre_page.dart';
void main() {
  testWidgets('página de apresentação pode ser exibida sem Firebase', (tester) async {
    await tester.pumpWidget(MaterialApp(home:SobrePage()));
    expect(find.byType(Scaffold),findsWidgets);
    expect(tester.takeException(),isNull);
  });
}
