import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ForceUpdateScreen extends StatelessWidget {
  final String message;
  final String link;
  const ForceUpdateScreen({
    super.key,
    required this.message,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    final displayMessage = (message.isNotEmpty)
        ? message
        : 'A new version is available. Please update the app to continue.';
    final hasLink = (link.isNotEmpty);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.system_update, size: 80, color: Colors.blueGrey),
              const SizedBox(height: 24),
              Text(
                displayMessage,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              if (hasLink)
                OutlinedButton(
                  onPressed: () async {
                    final uri = Uri.tryParse(link);
                    if (uri != null && await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  child: const Text('Update Now'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
