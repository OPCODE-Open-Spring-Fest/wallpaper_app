import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/wallpaper_model.dart';
import 'package:the_wallpaper_company/core/constants.dart';

class WallpaperProvider extends ChangeNotifier {
  List<Wallpaper> _wallpapers = [];
  int _visibleCount = 10;
  bool _isPaginating = false;

  List<Wallpaper> get wallpapers => _selectedCategory == 'All'
      ? _wallpapers.take(_visibleCount).toList()
      : _wallpapers
            .where((w) => w.category == _selectedCategory)
            .toList()
            .take(_visibleCount)
            .toList();

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

  void loadMore() {
    if (_visibleCount < _wallpapers.length && !_isPaginating) {
      _isPaginating = true;
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 500), () {
        _visibleCount = (_visibleCount + 10).clamp(0, _wallpapers.length);
        _isPaginating = false;
        notifyListeners();
      });
    }
  }

  List<String> get categories {
    return ['All', ...AppConstants.categories.map((c) => c['name']!)];
  }
}
