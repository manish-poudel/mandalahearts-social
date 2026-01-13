import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String iconAsset;
  final double height;
  final double borderRadius;

  const GoogleButton({
    super.key,
    required this.onPressed,
    this.text = 'Continue with Google',
    this.iconAsset =
        'assets/images/google.svg', // Ensure this is the official multi-color "G"
    this.height = 40.0, // Standard Google height
    this.borderRadius = 4.0, // Google default is 4px, use 20px for 'Pill' shape
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minWidth: 200,
      ), // Google suggests a min width
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF1F1F1F),
          // Official Google border color: #747775
          side: const BorderSide(color: Color(0xFF747775), width: 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Center content
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconAsset, height: 20, width: 20),
            const SizedBox(width: 12),
            Text(
              text,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1F1F1F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
