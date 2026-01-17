import 'package:flutter/material.dart';

class ProgressDialogBox extends StatelessWidget {
  const ProgressDialogBox({super.key, this.message = 'Processing…'});

  final String message;

  static bool _isShowing = false;

  static void show(BuildContext context, {String message = 'Processing…'}) {
    if (_isShowing) return;

    _isShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ProgressDialogBox(message: message),
    ).then((_) {
      _isShowing = false;
    });
  }

  static void hide(BuildContext context) {
    if (!_isShowing) return;

    Navigator.of(context, rootNavigator: true).pop();
    _isShowing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 12),
            Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
