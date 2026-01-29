import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/repository/app_config_repository.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          children: [
            // ---------------- Account ----------------
            _SectionTitle('Account'),
            _Item(
              icon: Icons.lock_outline_rounded,
              title: 'Reset password',
              onTap: () {
                context.push(AppRoute.passwordResetScreen.path);
              },
            ),

            const SizedBox(height: 28),

            // ---------------- Support ----------------
            _SectionTitle('Support'),
            _Item(
              icon: Icons.chat_bubble_outline_rounded,
              title: 'Give feedback',
              external: true,
              onTap: () => _launch(
                context,
                context
                        .read<AppConfigRepository>()
                        .cachedConfig
                        ?.app
                        ?.feedbackLink ??
                    "https://mandalahearts.com/feedback",
              ),
            ),
            _Item(
              icon: Icons.alternate_email_rounded,
              title: 'Contact us',
              external: true,
              onTap: () => _launch(
                context,
                context
                        .read<AppConfigRepository>()
                        .cachedConfig
                        ?.app
                        ?.contactUsLink ??
                    "https://mandalahearts.com/contact-us",
              ),
            ),

            const SizedBox(height: 28),

            // ---------------- Legal & About ----------------
            _SectionTitle('Legal & About'),
            _Item(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy policy',
              external: true,
              onTap: () => _handleLegal(context, true),
            ),
            _Item(
              icon: Icons.description_outlined,
              title: 'Terms & conditions',
              external: true,
              onTap: () => _handleLegal(context, false),
            ),
            _Item(
              icon: Icons.info_outline_rounded,
              title: 'About MandalaHearts',
              external: true,
              onTap: () => _launch(
                context,
                context
                        .read<AppConfigRepository>()
                        .cachedConfig
                        ?.app
                        ?.aboutLink ??
                    "https://mandalahearts.com/",
              ),
            ),

            const SizedBox(height: 36),

            // Soft danger zone card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _Item(
                    icon: Icons.logout_rounded,
                    title: 'Log out',
                    color: colorScheme.error,
                    showArrow: false,
                    onTap: () {
                      context.read<AuthRepository>().signOut();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                  const SizedBox(height: 8),
                  _Item(
                    icon: Icons.delete_outline_rounded,
                    title: 'Delete account',
                    color: colorScheme.error,
                    showArrow: false,
                    onTap: () {
                      context.push(AppRoute.deleteAccountScreen.path);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Center(
              child: Text(
                'Version 1.0.0',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.outline.withOpacity(0.6),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ---------------- helpers ----------------

  void _handleLegal(BuildContext context, bool privacy) {
    final config = context.read<AppConfigRepository>().cachedConfig;
    final url = privacy
        ? config?.app?.privacyPolicyLink ??
              'https://mandalahearts.com/privacy-policy'
        : config?.app?.termsAndConditionsLink ??
              'https://mandalahearts.com/terms-and-conditions';

    _launch(context, url);
  }

  Future<void> _launch(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

// ---------------- small widgets ----------------

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool external;
  final bool showArrow;
  final Color? color;

  const _Item({
    required this.icon,
    required this.title,
    required this.onTap,
    this.external = false,
    this.showArrow = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color ?? cs.onSurfaceVariant),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 15, color: color ?? cs.onSurface),
              ),
            ),
            if (showArrow)
              Icon(
                external
                    ? Icons.arrow_outward_rounded
                    : Icons.chevron_right_rounded,
                size: 18,
                color: cs.outline.withOpacity(0.4),
              ),
          ],
        ),
      ),
    );
  }
}
