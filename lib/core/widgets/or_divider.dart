import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.4,
            color: Colors.blueGrey.withValues(alpha: 10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'or',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 120),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 0.4,
            color: Colors.blueGrey.withValues(alpha: 10),
          ),
        ),
      ],
    );
  }
}
