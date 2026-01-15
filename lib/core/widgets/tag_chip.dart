import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const TagChip({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = fontSize * 0.8;
    final double verticalPadding = fontSize * 0.3;
    final double borderRadius = fontSize * 0.6;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: textColor,
        ),
      ),
    );
  }
}
