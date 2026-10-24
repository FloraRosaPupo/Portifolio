// ignore_for_file: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';

Widget buildPreview(
        {required String video,
        required String image,
        required String title,
        required Widget fallback}) =>
    _VideoPreview(video: video, image: image, title: title, fallback: fallback);

class _VideoPreview extends StatefulWidget {
  final String video, image, title;
  final Widget fallback;
  const _VideoPreview(
      {required this.video,
      required this.image,
      required this.title,
      required this.fallback});
  @override
  State<_VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<_VideoPreview> {
  static int _nextId = 0;
  late final String _viewId;
  late final html.VideoElement _video;
  html.IntersectionObserver? _observer;
  final List<StreamSubscription<dynamic>> _listeners = [];
  bool _visible = false, _pausedByUser = false, _failed = false;

  @override
  void initState() {
    super.initState();
    _viewId = 'project-video-${_nextId++}';
    _video = html.VideoElement()
      ..muted = true
      ..loop = true
      ..controls = true
      ..preload = 'none'
      ..poster = Uri.base.resolve('assets/${widget.image}').toString()
      ..setAttribute('playsinline', '')
      ..setAttribute('aria-label',
          'Prévia de ${widget.title}, dados demonstrativos. Controles para reproduzir e pausar.')
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'contain';
    _listeners.add(_video.onPause.listen((_) {
      if (_visible && !html.document.hidden!) _pausedByUser = true;
    }));
    _listeners.add(_video.onPlay.listen((_) => _pausedByUser = false));
    _listeners.add(_video.onError.listen((_) {
      if (mounted) setState(() => _failed = true);
    }));
    _listeners
        .add(html.document.onVisibilityChange.listen((_) => _updatePlayback()));
    _observer = html.IntersectionObserver((entries, _) {
      _visible = entries.any((entry) => entry.isIntersecting == true);
      _updatePlayback();
    }, {'threshold': 0.15});
    ui_web.platformViewRegistry.registerViewFactory(_viewId, (_) => _video);
  }

  void _updatePlayback() {
    if (!_visible || html.document.hidden == true) {
      _video.pause();
    } else if (!_pausedByUser) {
      if (_video.getAttribute('src') == null) {
        _video.src = Uri.base.resolve(widget.video).toString();
      }
      _video.play().catchError((_) {/* Native controls remain available. */});
    }
  }

  @override
  void dispose() {
    _observer?.disconnect();
    for (final listener in _listeners) {
      listener.cancel();
    }
    _video.pause();
    _video.removeAttribute('src');
    _video.load();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _failed
      ? widget.fallback
      : HtmlElementView(
          viewType: _viewId,
          onPlatformViewCreated: (_) => _observer?.observe(_video),
        );
}
