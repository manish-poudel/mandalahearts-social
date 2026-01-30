import 'package:flutter/material.dart';
import 'package:mandalahearts/core/widgets/shimmer_box.dart';

class PostCardShimmer extends StatelessWidget {
  const PostCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = screenHeight * 0.75;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 700, maxHeight: cardHeight),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ── Header ───────────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 32,
                        height: 32,
                        child: ShimmerBox(borderRadius: 16),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 120,
                            height: 12,
                            child: ShimmerBox(borderRadius: 6),
                          ),
                          SizedBox(height: 6),
                          SizedBox(
                            width: 60,
                            height: 10,
                            child: ShimmerBox(borderRadius: 6),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// ── Image Placeholder (same behavior) ────
                const Expanded(child: ShimmerBox(borderRadius: 0)),

                /// ── Caption Placeholder ─────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: double.infinity,
                        height: 12,
                        child: ShimmerBox(borderRadius: 6),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: 220,
                        height: 12,
                        child: ShimmerBox(borderRadius: 6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
