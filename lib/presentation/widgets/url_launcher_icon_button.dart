import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class UrlLauncherIcon extends StatelessWidget {
  final String url;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  const UrlLauncherIcon({
    super.key,
    required this.url,
    required this.icon,
    this.iconColor = Colors.blue,
    this.iconSize = 20,
  });

  Future<void> _launchUrl() async {
    final uri = Uri.parse(url);
    // if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    //   // In a real application, you'd show a Snackbar or dialog here.
    //   // For now, we'll print an error in debug mode.
    //   debugPrint('Could not launch $url');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: Padding(
        // Add padding to ensure a decent tap target size
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
