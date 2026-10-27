// ignore_for_file: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

String? readPreference(String key) {
  try {
    return html.window.localStorage['portfolio.$key'];
  } catch (_) {
    return null;
  }
}

void writePreference(String key, String value) {
  try {
    html.window.localStorage['portfolio.$key'] = value;
  } catch (_) {
    // Private browsing or blocked storage must not prevent preference changes.
  }
}

void updateDocumentLanguage(String language) {
  html.document.documentElement?.lang = language == 'pt' ? 'pt-BR' : language;
}

void updateDocumentTheme(String theme) {
  final dark = theme == 'dark' ||
      (theme == 'system' &&
          html.window.matchMedia('(prefers-color-scheme: dark)').matches);
  html.document.documentElement
      ?.setAttribute('data-theme', dark ? 'dark' : 'light');
}
