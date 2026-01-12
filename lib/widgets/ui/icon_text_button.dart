import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Widget icon;
  final double? iconSize;
  final TextStyle? textStyle;

  const IconTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.iconSize,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconTheme(
            data: IconThemeData(size: iconSize ?? 20),
            child: icon,
          ),
          const SizedBox(width: 12),
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
