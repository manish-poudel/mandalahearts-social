import 'package:flutter/material.dart';

class InfoTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  final int durationSeconds;

  const InfoTooltip({
    super.key,
    required this.child,
    required this.message,
    this.durationSeconds = 3, // default 3 seconds
  });

  @override
  State<InfoTooltip> createState() => _InfoTooltipState();
}

class _InfoTooltipState extends State<InfoTooltip> {
  OverlayEntry? _overlayEntry;

  void _showTooltip() {
    // Remove existing tooltip if any
    _overlayEntry?.remove();

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    final screenSize = MediaQuery.of(context).size;
    const maxWidth = 220.0;
    const tooltipHeight = 60.0;

    // Position tooltip above unless not enough space
    double top = offset.dy - tooltipHeight - 32;
    if (top < 0) top = offset.dy + size.height + 8;

    double left = offset.dx;
    if (left + maxWidth > screenSize.width - 8) {
      left = screenSize.width - maxWidth - 8;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            _overlayEntry?.remove();
            _overlayEntry = null;
          },
          behavior: HitTestBehavior.translucent,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                // Tooltip container positioned relative to icon
                Positioned(
                  top: top,
                  left: left,
                  width: maxWidth,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        widget.message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);

    // Auto-dismiss after custom duration
    Future.delayed(Duration(seconds: widget.durationSeconds), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: _showTooltip, child: widget.child);
  }
}
