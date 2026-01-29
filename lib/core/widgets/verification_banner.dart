import 'package:flutter/material.dart';

class VerificationBanner extends StatefulWidget {
  final VoidCallback onResend;

  const VerificationBanner({super.key, required this.onResend});

  @override
  State<VerificationBanner> createState() => _VerificationBannerState();
}

class _VerificationBannerState extends State<VerificationBanner> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    final theme = Theme.of(context);
    // Light Green / Mint palette
    final Color infoGreen = const Color(0xFFE8F5E9);
    final Color borderGreen = const Color(0xFFC8E6C9);
    final Color iconGreen = const Color(0xFF4CAF50);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: infoGreen,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderGreen),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline_rounded, color: iconGreen, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Verify your email to secure your account and access all features.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.green[900],
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => _isVisible = false),
                child: Icon(
                  Icons.close_rounded,
                  size: 21,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Resend button moved to the bottom, separate from the close icon
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: widget.onResend,
              icon: const Icon(Icons.send_rounded, size: 14),
              label: const Text(
                'Send verification link',
                style: TextStyle(fontSize: 12),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.6),
                foregroundColor: iconGreen,
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
