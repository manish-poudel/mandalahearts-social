import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/repository/app_config_repository.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsSheet extends StatelessWidget {
  final BuildContext parentContext;
  const SettingsSheet({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        const SizedBox(height: 12),
        // Minimal Header Handle
        Container(
          width: 36,
          height: 4,
          decoration: BoxDecoration(
            color: colorScheme.outlineVariant.withOpacity(0.5),
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        // Title Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              const SizedBox(width: 40),
              Expanded(
                child: Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded, size: 22),
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.surfaceVariant.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 16),

              // --- Account Section ---
              _buildSectionGroup(
                context,
                title: "Account",
                items: [
                  _SettingsTile(
                    icon: Icons.lock_outline_rounded,
                    title: 'Reset Password',
                    onTap: () {
                      Navigator.pop(context);
                      parentContext.push(AppRoute.passwordResetScreen.path);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- Support Section (URLs) ---
              _buildSectionGroup(
                context,
                title: "Support",
                items: [
                  _SettingsTile(
                    icon: Icons.chat_bubble_outline_rounded,
                    title: 'Give Feedback',
                    isExternal: true,
                    onTap: () {
                      Navigator.pop(context);
                      launchUrl(
                        Uri.parse('https://mandalahearts.com/feedback'),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                  _SettingsTile(
                    icon: Icons.alternate_email_rounded,
                    title: 'Contact Us',
                    isExternal: true,
                    onTap: () {
                      Navigator.pop(context);
                      launchUrl(
                        Uri.parse('https://mandalahearts.com/contact'),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- Legal Section ---
              _buildSectionGroup(
                context,
                title: "Legal",
                items: [
                  _SettingsTile(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    isExternal: true,
                    onTap: () => _handleUrl(context, isPrivacy: true),
                  ),
                  _SettingsTile(
                    icon: Icons.description_outlined,
                    title: 'Terms & Conditions',
                    isExternal: true,
                    onTap: () => _handleUrl(context, isPrivacy: false),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- Session Section ---
              _buildSectionGroup(
                context,
                title: "Session",
                items: [
                  _SettingsTile(
                    icon: Icons.logout_rounded,
                    title: 'Logout',
                    iconColor: colorScheme.error,
                    textColor: colorScheme.error,
                    showChevron: false,
                    onTap: () {
                      context.read<AuthRepository>().signOut();
                      Navigator.pop(context);
                      Navigator.of(parentContext).pop();
                    },
                  ),
                ],
              ),

              // --- Version Info ---
              const SizedBox(height: 32),
              Center(
                child: Text(
                  'Version 1.0.0',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.outline.withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionGroup(
    BuildContext context, {
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.outline,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ),
        Container(
          clipBehavior: Clip
              .antiAlias, // Ensures internal tiles don't bleed over rounded corners
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.surfaceVariant.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  void _handleUrl(BuildContext context, {required bool isPrivacy}) {
    final appConfig = context.read<AppConfigRepository>().cachedConfig;
    final url = isPrivacy
        ? appConfig?.app?.privacyPolicyLink ??
              'https://mandalahearts.com/privacy-policy'
        : appConfig?.app?.termsAndConditionsLink ??
              'https://mandalahearts.com/terms-and-conditions';

    Navigator.pop(context);
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}

// Internal tile widget used for list items
class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;
  final bool isExternal;
  final bool showChevron;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.textColor,
    this.isExternal = false,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).colorScheme.onSurfaceVariant,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Theme.of(context).colorScheme.onSurface,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: showChevron
          ? Icon(
              isExternal
                  ? Icons.arrow_outward_rounded
                  : Icons.chevron_right_rounded,
              size: 18,
              color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
            )
          : null,
      onTap: onTap,
    );
  }
}
