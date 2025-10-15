// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'The Wallpaper Co.';

  @override
  String get searchHint => 'Search wallpapers by title or category...';

  @override
  String get home => 'Home';

  @override
  String get favorites => 'Favorites';

  @override
  String get categories => 'Categories';

  @override
  String get all => 'All';

  @override
  String get nature => 'Nature';

  @override
  String get abstract => 'Abstract';

  @override
  String get urban => 'Urban';

  @override
  String get minimal => 'Minimal';

  @override
  String get space => 'Space';

  @override
  String get animals => 'Animals';

  @override
  String get technology => 'Technology';

  @override
  String get art => 'Art';

  @override
  String get noResultsTitle => 'No wallpapers found';

  @override
  String noResultsMessage(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String get clearSearch => 'Clear Search';

  @override
  String get download => 'Download';

  @override
  String get setWallpaper => 'Set Wallpaper';

  @override
  String get share => 'Share';

  @override
  String get addToFavorites => 'Add to Favorites';

  @override
  String get removeFromFavorites => 'Remove from Favorites';

  @override
  String get downloadSuccess => 'Downloaded successfully';

  @override
  String get downloadFailed => 'Download failed';

  @override
  String get wallpaperSet => 'Wallpaper set successfully';

  @override
  String get wallpaperSetFailed => 'Failed to set wallpaper';

  @override
  String get loading => 'Loading...';

  @override
  String get retry => 'Retry';

  @override
  String get error => 'Error';

  @override
  String get networkError => 'Network error occurred';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get settings => 'Settings';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get developer => 'Developer';

  @override
  String get pullToRefresh => 'Pull to refresh';

  @override
  String get releaseToRefresh => 'Release to refresh';

  @override
  String get refreshing => 'Refreshing...';

  @override
  String get noFavorites => 'No favorites yet';

  @override
  String get noFavoritesMessage =>
      'Add some wallpapers to your favorites to see them here';

  @override
  String get mountain => 'Mountain';

  @override
  String get forest => 'Forest';

  @override
  String get ocean => 'Ocean';

  @override
  String get sunset => 'Sunset';

  @override
  String get sunrise => 'Sunrise';

  @override
  String get galaxy => 'Galaxy';

  @override
  String get city => 'City';
}
