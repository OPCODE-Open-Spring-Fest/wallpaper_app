import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  static const String _key = 'favorite_wallpaper_ids';
  List<String> _favoriteIds = [];
  List<String> get favoriteIds => _favoriteIds;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _favoriteIds = prefs.getStringList(_key) ?? [];
    notifyListeners();
  }

  bool isFavorite(String id) => _favoriteIds.contains(id);

  Future<void> addFavorite(String id) async {
    if (!_favoriteIds.contains(id)) {
      _favoriteIds.add(id);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_key, _favoriteIds);
      notifyListeners();
    }
  }

  Future<void> removeFavorite(String id) async {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_key, _favoriteIds);
      notifyListeners();
    }
  }
}
