import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WallpaperShimmer extends StatelessWidget {
  const WallpaperShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? Colors.grey[850]! : Colors.grey[300]!;
    final highlightColor = isDark ? Colors.grey[700]! : Colors.grey[100]!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          height: 280, // Fixed height to avoid infinite constraints error
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
