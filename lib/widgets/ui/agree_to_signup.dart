import 'package:flutter/material.dart';

class AgreeToSignUp extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  const AgreeToSignUp({
    super.key,
    this.text =
        "By clicking Agree & Join or Continue, you agree to the MandalaHearts ",
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurface.withValues(alpha: 120),
          height: 1.4,
        ),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: 'Terms and conditions',
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            // recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(text: ' & '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            // recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
