import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlText extends StatelessWidget {
  const UrlText({
    required this.url,
    required this.text,
    required this.style,
    super.key,
  });

  final String url, text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            final uri = Uri.parse(url);
            if (!await launchUrl(uri)) {
              throw Exception('Could not launch $url ');
            }
          },
          child: Link(
            uri: Uri.parse(url),
            builder: (context, onLlink) {
              return Text(
                text,
                style: style,
              );
            },
          ),
        ),
      );
}
