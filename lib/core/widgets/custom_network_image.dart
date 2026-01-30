import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final double aspectRatio; // optional: width / height fallback

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height = 320,
    this.borderRadius = 8,
    this.fit = BoxFit.cover,
    this.aspectRatio = 16 / 9, // default fallback aspect ratio
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxSize = constraints.maxWidth;
        final size = maxSize > 600 ? 480.0 : maxSize;
        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.network(
            imageUrl,
            width: size,
            height: size,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: size,
                height: size,
                color: Colors.grey.shade300,
                child: const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: size,
                height: size,
                color: Colors.grey.shade200,
                child: Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 32,
                    color: Colors.red.shade400,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
