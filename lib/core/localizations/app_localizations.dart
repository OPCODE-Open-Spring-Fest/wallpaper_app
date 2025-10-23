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
      case 'es':
        return 'La Compañía de Fondos';
      case 'ja':
        return '壁紙会社';
      default:
        return 'The Wallpaper Co.';
    }
  }

  String get searchHint {
    switch (locale.languageCode) {
      case 'hi':
        return 'शीर्षक या श्रेणी द्वारा वॉलपेपर खोजें...';
      case 'es':
        return 'Busca fondos por título o categoría...';
      case 'ja':
        return 'タイトルやカテゴリで壁紙を検索...';
      default:
        return 'Search wallpapers by title or category...';
    }
  }

  String get home {
    switch (locale.languageCode) {
      case 'hi':
        return 'होम';
      case 'es':
        return 'Inicio';
      case 'ja':
        return 'ホーム';
      default:
        return 'Home';
    }
  }

  String get favorites {
    switch (locale.languageCode) {
      case 'hi':
        return 'पसंदीदा';
      case 'es':
        return 'Favoritos';
      case 'ja':
        return 'お気に入り';
      default:
        return 'Favorites';
    }
  }

  String get all {
    switch (locale.languageCode) {
      case 'hi':
        return 'सभी';
      case 'es':
        return 'Todo';
      case 'ja':
        return 'すべて';
      default:
        return 'All';
    }
  }

  String get nature {
    switch (locale.languageCode) {
      case 'hi':
        return 'प्रकृति';
      case 'es':
        return 'Naturaleza';
      case 'ja':
        return '自然';
      default:
        return 'Nature';
    }
  }

  String get abstract {
    switch (locale.languageCode) {
      case 'hi':
        return 'अमूर्त';
      case 'es':
        return 'Abstracto';
      case 'ja':
        return '抽象的';
      default:
        return 'Abstract';
    }
  }

  String get urban {
    switch (locale.languageCode) {
      case 'hi':
        return 'शहरी';
      case 'es':
        return 'Urbano';
      case 'ja':
        return '都市';
      default:
        return 'Urban';
    }
  }

  String get minimal {
    switch (locale.languageCode) {
      case 'hi':
        return 'न्यूनतम';
      case 'es':
        return 'Minimalista';
      case 'ja':
        return 'ミニマル';
      default:
        return 'Minimal';
    }
  }

  String get space {
    switch (locale.languageCode) {
      case 'hi':
        return 'अंतरिक्ष';
      case 'es':
        return 'Espacio';
      case 'ja':
        return '宇宙';
      default:
        return 'Space';
    }
  }

  String get animals {
    switch (locale.languageCode) {
      case 'hi':
        return 'जानवर';
      case 'es':
        return 'Animales';
      case 'ja':
        return '動物';
      default:
        return 'Animals';
    }
  }

  String get art {
    switch (locale.languageCode) {
      case 'hi':
        return 'कला';
      case 'es':
        return 'Arte';
      case 'ja':
        return 'アート';
      default:
        return 'Art';
    }
  }

  String get cars {
    switch (locale.languageCode) {
      case 'hi':
        return 'कारें';
      case 'es':
        return 'Coches';
      case 'ja':
        return '車';
      default:
        return 'Cars';
    }
  }

  String get download {
    switch (locale.languageCode) {
      case 'hi':
        return 'डाउनलोड';
      case 'es':
        return 'Descargar';
      case 'ja':
        return 'ダウンロード';
      default:
        return 'Download';
    }
  }

  String get share {
    switch (locale.languageCode) {
      case 'hi':
        return 'साझा करें';
      case 'es':
        return 'Compartir';
      case 'ja':
        return '共有する';
      default:
        return 'Share';
    }
  }

  String get clearSearch {
    switch (locale.languageCode) {
      case 'hi':
        return 'खोज साफ़ करें';
      case 'es':
        return 'Borrar búsqueda';
      case 'ja':
        return '検索をクリア';
      default:
        return 'Clear Search';
    }
  }

  String get noResultsTitle {
    switch (locale.languageCode) {
      case 'hi':
        return 'कोई वॉलपेपर नहीं मिला';
      case 'es':
        return 'No se encontraron fondos';
      case 'ja':
        return '壁紙が見つかりません';
      default:
        return 'No wallpapers found';
    }
  }

  String noResultsMessage(String query) {
    switch (locale.languageCode) {
      case 'hi':
        return '"$query" के लिए कोई परिणाम नहीं';
      case 'es':
        return 'Sin resultados para "$query"';
      case 'ja':
        return '"$query" の結果はありません';
      default:
        return 'No results for "$query"';
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
