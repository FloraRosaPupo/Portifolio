import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/features/portfolio/data/translations.dart';

void main() {
  test('Portuguese is unchanged and proper names have a safe fallback', () {
    for (final source in translations.keys) {
      expect(translate(source, 'pt'), source);
    }
    for (final language in ['pt', 'en', 'es']) {
      expect(translate('Easy Comlink', language), 'Easy Comlink');
      expect(translate('ASSID', language), 'ASSID');
    }
  });

  test('every translation has both target languages', () {
    for (final entry in translations.entries) {
      expect(entry.value.$1.trim(), isNotEmpty, reason: entry.key);
      expect(entry.value.$2.trim(), isNotEmpty, reason: entry.key);
      expect(translate(entry.key, 'en'), entry.value.$1);
      expect(translate(entry.key, 'es'), entry.value.$2);
    }
  });

  test('navigation and resume labels distinguish language and document', () {
    expect(translate('Projetos', 'en'), 'Projects');
    expect(translate('Projetos', 'es'), 'Proyectos');
    expect(
      translate('Baixar currículo (PT) ↓', 'en'),
      'Download résumé (PT) ↓',
    );
    expect(translate('Baixar currículo (PT) ↓', 'es'), 'Descargar CV (PT) ↓');
  });

  test('preview accessibility templates retain product placeholder', () {
    for (final entry in translations.entries) {
      if (entry.key.contains('{title}')) {
        expect(entry.value.$1, contains('{title}'));
        expect(entry.value.$2, contains('{title}'));
      }
    }
  });
}
