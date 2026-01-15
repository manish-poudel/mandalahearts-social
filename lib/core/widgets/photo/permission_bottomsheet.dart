import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class PermissionBottomSheet extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;

  const PermissionBottomSheet({
    super.key,
    this.title = "Permission Required",
    this.message =
        "We need access to your photos to continue. Please update your permissions in settings.",
    this.buttonText = "Open Settings",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () async {
              Navigator.pop(context); // Close bottom sheet
              await PhotoManager.openSetting(); // Open settings
            },
            child: Text(buttonText),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
