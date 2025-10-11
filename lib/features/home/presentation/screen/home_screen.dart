import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:the_wallpaper_company/core/loader.dart';
import 'package:the_wallpaper_company/features/favorite/presentation/screen/favorite_screen.dart';
import 'package:the_wallpaper_company/features/home/presentation/screen/wallpaper_screen.dart';
import 'package:the_wallpaper_company/features/home/presentation/widgets/wallpaper_shimmer.dart';
import 'package:the_wallpaper_company/features/home/provider/wallpaper_provider.dart';
import 'package:the_wallpaper_company/firebase_message.dart';
import '../widgets/category_carousel.dart';
import 'package:the_wallpaper_company/core/constants.dart';
import 'package:the_wallpaper_company/features/home/presentation/widgets/wallpaper_tile.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController = RefreshController();
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WallpaperProvider>(context, listen: false).fetchWallpapers();
    });
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final provider = Provider.of<WallpaperProvider>(context, listen: false);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !provider.isPaginating) {
      provider.loadMore();
    }
  }

  void _onRefresh() async {
    await Provider.of<WallpaperProvider>(
      context,
      listen: false,
    ).fetchWallpapers();
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            Consumer<WallpaperProvider>(
              builder: (context, provider, child) {
                final visibleWallpapers = provider.wallpapers;
                return Column(
                  children: [
                    Expanded(
                      child: provider.isLoading
                          ? const Loader()
                          : SmartRefresher(
                              header: const ClassicHeader(),
                              enablePullDown: true,
                              controller: _refreshController,
                              onRefresh: _onRefresh,
                              child: CustomScrollView(
                                physics: const BouncingScrollPhysics(),
                                controller: _scrollController,
                                slivers: [
                                  SliverAppBar(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    pinned: false,
                                    floating: true,
                                    // floating: true,
                                    flexibleSpace: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(24),
                                          bottomRight: Radius.circular(24),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(24),
                                          bottomRight: Radius.circular(24),
                                        ),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 12,
                                            sigmaY: 12,
                                          ),
                                          child: CategoryCarousel(
                                            categories: AppConstants.categories,
                                            selectedCategory:
                                                provider.selectedCategory,
                                            onCategorySelected:
                                                provider.selectCategory,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // expandedHeight: 72,
                                    toolbarHeight: 150,
                                  ),
                                  SliverPadding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 8,
                                    ),
                                    sliver: SliverMasonryGrid.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      childCount:
                                          visibleWallpapers.length +
                                          (provider.isPaginating ? 1 : 0),
                                      itemBuilder: (context, index) {
                                        if (provider.isPaginating &&
                                            index == visibleWallpapers.length) {
                                          return const WallpaperShimmer();
                                        }
                                        final wallpaper =
                                            visibleWallpapers[index];
                                        return InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    WallpaperScreen(
                                                      wallpapers:
                                                          visibleWallpapers,
                                                      initialIndex: index,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: WallpaperTile(
                                            imageUrl: wallpaper.imageUrl,
                                            title: wallpaper.title,
                                            id: wallpaper.id,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
            const FavoriteScreen(),
          ],
        ),
        bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.7,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CrystalNavigationBar(
              height: 120,
              enableFloatingNavBar: true,
              currentIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              backgroundColor: Colors.transparent,
              unselectedItemColor: Colors.blueGrey,
              selectedItemColor: Colors.pinkAccent,
              items: [
                CrystalNavigationBarItem(icon: Icons.home),
                CrystalNavigationBarItem(icon: Icons.favorite),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
