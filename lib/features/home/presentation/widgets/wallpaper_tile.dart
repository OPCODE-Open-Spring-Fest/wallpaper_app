import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_wallpaper_company/features/favorite/presentation/widgets/favorite_icon_button.dart';

class WallpaperTile extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String? id;

  const WallpaperTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.id,
  });

  @override
  State<WallpaperTile> createState() => _WallpaperTileState();
}

class _WallpaperTileState extends State<WallpaperTile>
    with AutomaticKeepAliveClientMixin {
  static final CacheManager _sharedCacheManager = CacheManager(
    Config(
      'wallpaperCache',
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 300,
    ),
  );

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 320),
        child: Stack(
          children: [
            CachedNetworkImage(
              cacheManager: _sharedCacheManager,
              imageUrl: widget.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[800]!
                    : Colors.grey[300]!,
                highlightColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[700]!
                    : Colors.grey[100]!,
                child: Container(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[800]
                      : Colors.grey[300],
                  height: 200,
                ),
              ),
              errorWidget: (context, url, error) => const SizedBox(
                height: 200,
                child: Center(child: Icon(Icons.error)),
              ),
            ),
            FavoriteIconButton(id: widget.id, left: 8),
          ],
        ),
      ),
    );
  }
}
