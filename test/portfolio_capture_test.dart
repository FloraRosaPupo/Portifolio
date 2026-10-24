import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    if (!const bool.fromEnvironment('CAPTURE_PORTFOLIO')) return;
    final fonts = FontLoader('Montserrat');
    for (final weight in ['Regular', 'Medium', 'Bold']) {
      fonts.addFont(rootBundle.load('assets/fonts/Montserrat-$weight.ttf'));
    }
    await fonts.load();
    await (FontLoader('MaterialIcons')
          ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf')))
        .load();
  });
  for (final width in [1440.0, 430.0]) {
    testWidgets('portfolio screenshots $width', (tester) async {
      tester.view.physicalSize = Size(width, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final key = GlobalKey();
      await tester.pumpWidget(RepaintBoundary(key: key, child: const MyApp()));
      await tester.pumpAndSettle();
      Future<void> save(String section) async {
        expect(tester.takeException(), isNull);
        final boundary =
            key.currentContext!.findRenderObject() as RenderRepaintBoundary;
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: 1);
          final data = await image.toByteData(format: ui.ImageByteFormat.png);
          final file = File('captures/portfolio-${width.toInt()}-$section.png');
          await file.create(recursive: true);
          await file.writeAsBytes(data!.buffer.asUint8List());
          image.dispose();
        });
      }

      await save('inicio');
      await tester.tap(find.text('Conheça os projetos ↗'));
      await tester.pumpAndSettle();
      await save('projetos');
      await tester.ensureVisible(find.text('PROJETOS INDEPENDENTES'));
      await tester.pumpAndSettle();
      await save('independentes');
      await tester.ensureVisible(find.text('APLICATIVOS PUBLICADOS'));
      await tester.pumpAndSettle();
      await save('publicados');
      await tester.ensureVisible(find.text('Qualidade de software'));
      await tester.pumpAndSettle();
      await save('qualidade');
      await tester.ensureVisible(find.text('Experiência'));
      await tester.pumpAndSettle();
      await save('experiencia');
    }, skip: !const bool.fromEnvironment('CAPTURE_PORTFOLIO'));
  }
}
