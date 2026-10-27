import 'preferences.dart';
import 'package:flutter/material.dart';
import 'project_preview_stub.dart'
    if (dart.library.html) 'project_preview_web.dart' as platform;

class ProjectPreview extends StatelessWidget {
  final String image, video, title;
  const ProjectPreview({
    super.key,
    required this.image,
    required this.video,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final poster = Image.asset(
      image,
      fit: BoxFit.contain,
      semanticLabel: tr(
        context,
        'Demonstração do aplicativo {title} com dados fictícios',
      ).replaceAll('{title}', title),
    );
    return AspectRatio(
      aspectRatio: 430 / 932,
      child: MediaQuery.of(context).disableAnimations
          ? poster
          : platform.buildPreview(
              video: video,
              image: image,
              title: title,
              label: tr(
                context,
                'Prévia de {title}, dados demonstrativos. Controles para reproduzir e pausar.',
              ).replaceAll('{title}', title),
              fallback: poster,
            ),
    );
  }
}
