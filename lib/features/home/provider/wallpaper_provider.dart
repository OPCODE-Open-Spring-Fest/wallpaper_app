import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/wallpaper_model.dart';
import 'package:the_wallpaper_company/core/constants.dart';

class WallpaperProvider extends ChangeNotifier {
  List<Wallpaper> _wallpapers = [];
  int _visibleCount = 10;
  bool _isPaginating = false;
  String _searchQuery = '';

  List<Wallpaper> get wallpapers {
    List<Wallpaper> filteredWallpapers = _wallpapers;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filteredWallpapers = _wallpapers.where((wallpaper) {
        return wallpaper.title.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            ) ||
            wallpaper.category.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            );
      }).toList();
    }

    // Apply category filter
    if (_selectedCategory != 'All') {
      filteredWallpapers = filteredWallpapers
          .where((w) => w.category == _selectedCategory)
          .toList();
    }

    return filteredWallpapers.take(_visibleCount).toList();
  }

  void addWallpaper(Wallpaper wallpaper) {
    _wallpapers.add(wallpaper);
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool get isPaginating => _isPaginating;
  int get visibleCount => _visibleCount;

  String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;

  String get searchQuery => _searchQuery;

  Future<void> fetchWallpapers() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(
        Uri.parse('https://jsonkeeper.com/b/ORGZR'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print(data);
        _wallpapers = data.map((json) => Wallpaper.fromJson(json)).toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    _visibleCount = 10;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    _visibleCount = 10; // Reset visible count when searching
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _visibleCount = 10;
    notifyListeners();
  }

  void loadMore() {
    // Get the total count of filtered wallpapers
    List<Wallpaper> filteredWallpapers = _wallpapers;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filteredWallpapers = _wallpapers.where((wallpaper) {
        return wallpaper.title.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            ) ||
            wallpaper.category.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            );
      }).toList();
    }

    // Apply category filter
    if (_selectedCategory != 'All') {
      filteredWallpapers = filteredWallpapers
          .where((w) => w.category == _selectedCategory)
          .toList();
    }

    if (_visibleCount < filteredWallpapers.length && !_isPaginating) {
      _isPaginating = true;
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 500), () {
        _visibleCount = (_visibleCount + 10).clamp(
          0,
          filteredWallpapers.length,
        );
        _isPaginating = false;
        notifyListeners();
      });
    }
  }

  List<String> get categories {
    return ['All', ...AppConstants.categories.map((c) => c['name']!)];
  }
}
