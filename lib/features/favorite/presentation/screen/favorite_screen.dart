import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_wallpaper_company/features/favorite/provider/favorite_provider.dart';
import 'package:the_wallpaper_company/features/home/provider/wallpaper_provider.dart';
import 'package:the_wallpaper_company/features/home/presentation/widgets/wallpaper_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<FavoriteProvider, WallpaperProvider>(
        builder: (context, favProvider, wallpaperProvider, _) {
          final favIds = favProvider.favoriteIds;
          final favWallpapers = wallpaperProvider.wallpapers
              .where((w) => favIds.contains(w.id.toString()))
              .toList();
          if (favWallpapers.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No favorites yet. Tap the heart icon to add wallpapers!',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childCount: favWallpapers.length,
                  itemBuilder: (context, index) {
                    final wallpaper = favWallpapers[index];
                    return WallpaperTile(
                      imageUrl: wallpaper.imageUrl,
                      title: wallpaper.title,
                      id: wallpaper.id.toString(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
