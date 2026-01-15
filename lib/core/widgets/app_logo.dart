import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandalahearts/core/widgets/tag_chip.dart';
import 'package:mandalahearts/enums/app_release_tag.dart';

class AppLogo extends StatelessWidget {
  final double fontSize;
  final AppReleaseTag? tag;
  final Color? color;

  const AppLogo({super.key, this.fontSize = 38, this.tag, this.color});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Text(
          'MandalaHearts',
          style: GoogleFonts.playfairDisplay(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
            color: color ?? colorScheme.onSurface,
          ),
        ),

        if (tag != null)
          Positioned(top: -fontSize * 0.40, child: _buildReleaseTag(fontSize)),
      ],
    );
  }

  Widget _buildReleaseTag(double logoFontSize) {
    late final Color backgroundColor;
    late final Color textColor;

    switch (tag!) {
      case AppReleaseTag.alpha:
        backgroundColor = const Color(0xFFEDE7F6);
        textColor = const Color(0xFF5E35B1);
        break;

      case AppReleaseTag.beta:
        backgroundColor = const Color(0xFFE8F5E9);
        textColor = const Color(0xFF2E7D32);
        break;

      case AppReleaseTag.internal:
        backgroundColor = const Color(0xFFE3F2FD);
        textColor = const Color(0xFF1565C0);
        break;
    }

    return TagChip(
      label: tag!.name,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: logoFontSize * 0.28,
    );
  }
}
