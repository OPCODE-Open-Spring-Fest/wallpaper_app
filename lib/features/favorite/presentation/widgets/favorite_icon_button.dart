import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_wallpaper_company/features/favorite/provider/favorite_provider.dart';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';

class FavoriteIconButton extends StatelessWidget {
  final String? id;
  final double top;
  final double? left;
  final double? right;

  const FavoriteIconButton({
    super.key,
    required this.id,
    this.top = 8,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Consumer<FavoriteProvider>(
        builder: (context, favProvider, _) {
          final isFav = id != null && favProvider.isFavorite(id!);
          return GestureDetector(
            onTap: () async {
              if (id == null) return;
              if (isFav) {
                await favProvider.removeFavorite(id!);
              } else {
                await favProvider.addFavorite(id!);
              }
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.bounceOut,
              switchOutCurve: Curves.bounceIn,
              child: FlipInY(
                key: ValueKey(isFav),
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAlias,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.18),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        key: ValueKey(isFav),
                        color: isFav ? Colors.pinkAccent : Colors.white70,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
