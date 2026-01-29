import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/repository/app_config_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class AgreeToSignUp extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const AgreeToSignUp({
    super.key,
    this.text =
        "By clicking Agree & Join or Continue, you agree to the MandalaHearts ",
    this.textAlign = TextAlign.center,
  });

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final appConfig = context.read<AppConfigRepository>().cachedConfig;

    final termsUrl =
        appConfig?.app?.termsAndConditionsLink ??
        'https://mandalahearts.com/terms';
    final privacyUrl =
        appConfig?.app?.privacyPolicyLink ??
        'https://mandalahearts.com/privacy';

    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurface.withOpacity(0.7),
          height: 1.4,
        ),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _launchUrl(termsUrl),
          ),
          const TextSpan(text: ' & '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _launchUrl(privacyUrl),
          ),
        ],
      ),
    );
  }
}
