import 'package:flutter/material.dart';
import '../providers/language_provider.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // App strings
  String get appTitle {
    switch (locale.languageCode) {
      case 'hi':
        return 'द वॉलपेपर कंपनी';
      default:
        return 'The Wallpaper Co.';
    }
  }

  String get searchHint {
    switch (locale.languageCode) {
      case 'hi':
        return 'शीर्षक या श्रेणी द्वारा वॉलपेपर खोजें...';
      default:
        return 'Search wallpapers by title or category...';
    }
  }

  String get home {
    switch (locale.languageCode) {
      case 'hi':
        return 'होम';
      default:
        return 'Home';
    }
  }

  String get favorites {
    switch (locale.languageCode) {
      case 'hi':
        return 'पसंदीदा';
      default:
        return 'Favorites';
    }
  }

  String get all {
    switch (locale.languageCode) {
      case 'hi':
        return 'सभी';
      default:
        return 'All';
    }
  }

  String get nature {
    switch (locale.languageCode) {
      case 'hi':
        return 'प्रकृति';
      default:
        return 'Nature';
    }
  }

  String get abstract {
    switch (locale.languageCode) {
      case 'hi':
        return 'अमूर्त';
      default:
        return 'Abstract';
    }
  }

  String get urban {
    switch (locale.languageCode) {
      case 'hi':
        return 'शहरी';
      default:
        return 'Urban';
    }
  }

  String get minimal {
    switch (locale.languageCode) {
      case 'hi':
        return 'न्यूनतम';
      default:
        return 'Minimal';
    }
  }

  String get space {
    switch (locale.languageCode) {
      case 'hi':
        return 'अंतरिक्ष';
      default:
        return 'Space';
    }
  }

  String get animals {
    switch (locale.languageCode) {
      case 'hi':
        return 'जानवर';
      default:
        return 'Animals';
    }
  }

  String get art {
    switch (locale.languageCode) {
      case 'hi':
        return 'कला';
      default:
        return 'Art';
    }
  }

  String get cars {
    switch (locale.languageCode) {
      case 'hi':
        return 'कारें';
      default:
        return 'Cars';
    }
  }

  String get noResultsTitle {
    switch (locale.languageCode) {
      case 'hi':
        return 'कोई वॉलपेपर नहीं मिला';
      default:
        return 'No wallpapers found';
    }
  }

  String noResultsMessage(String query) {
    switch (locale.languageCode) {
      case 'hi':
        return '"$query" के लिए कोई परिणाम नहीं';
      default:
        return 'No results for "$query"';
    }
  }

  String get clearSearch {
    switch (locale.languageCode) {
      case 'hi':
        return 'खोज साफ़ करें';
      default:
        return 'Clear Search';
    }
  }

  String get download {
    switch (locale.languageCode) {
      case 'hi':
        return 'डाउनलोड';
      default:
        return 'Download';
    }
  }

  String get setWallpaper {
    switch (locale.languageCode) {
      case 'hi':
        return 'वॉलपेपर सेट करें';
      default:
        return 'Set Wallpaper';
    }
  }

  String get share {
    switch (locale.languageCode) {
      case 'hi':
        return 'साझा करें';
      default:
        return 'Share';
    }
  }

  String get loading {
    switch (locale.languageCode) {
      case 'hi':
        return 'लोड हो रहा है...';
      default:
        return 'Loading...';
    }
  }

  String get error {
    switch (locale.languageCode) {
      case 'hi':
        return 'त्रुटि';
      default:
        return 'Error';
    }
  }

  String get retry {
    switch (locale.languageCode) {
      case 'hi':
        return 'पुनः प्रयास करें';
      default:
        return 'Retry';
    }
  }

  String get noFavorites {
    switch (locale.languageCode) {
      case 'hi':
        return 'अभी तक कोई पसंदीदा नहीं';
      default:
        return 'No favorites yet';
    }
  }

  String get noFavoritesMessage {
    switch (locale.languageCode) {
      case 'hi':
        return 'यहाँ देखने के लिए कुछ वॉलपेपर को अपने पसंदीदा में जोड़ें';
      default:
        return 'Add some wallpapers to your favorites to see them here';
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return LanguageProvider.supportedLocales
        .map((l) => l.languageCode)
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
