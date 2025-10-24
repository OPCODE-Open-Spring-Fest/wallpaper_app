import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');
  static const String _languagePreferenceKey = 'selectedLanguage';

  Locale get currentLocale => _currentLocale;

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('hi'),
    Locale('es'),
    Locale('ja'),
  ];

  LanguageProvider() {
    _loadLanguagePreference();
  }

  void setLanguage(Locale locale) {
    if (_currentLocale == locale) return;
    _currentLocale = locale;
    _saveLanguagePreference();
    notifyListeners();
  }

  void toggleLanguage() {
    // Cycle: en → hi → es → ja → en
    if (_currentLocale.languageCode == 'en') {
      setLanguage(const Locale('hi'));
    } else if (_currentLocale.languageCode == 'hi') {
      setLanguage(const Locale('es'));
    } else if (_currentLocale.languageCode == 'es') {
      setLanguage(const Locale('ja'));
    } else {
      setLanguage(const Locale('en'));
    }
  }

  bool get isEnglish => _currentLocale.languageCode == 'en';
  bool get isHindi => _currentLocale.languageCode == 'hi';
  bool get isSpanish => _currentLocale.languageCode == 'es';
  bool get isJapanese => _currentLocale.languageCode == 'ja';

  String get currentLanguageName {
    switch (_currentLocale.languageCode) {
      case 'hi':
        return 'हिंदी';
      case 'es':
        return 'Español';
      case 'ja':
        return '日本語';
      default:
        return 'English';
    }
  }

  Future<void> _loadLanguagePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final code = prefs.getString(_languagePreferenceKey) ?? 'en';
      _currentLocale = Locale(code);
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading language preference: $e');
    }
  }

  Future<void> _saveLanguagePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _languagePreferenceKey,
        _currentLocale.languageCode,
      );
    } catch (e) {
      debugPrint('Error saving language preference: $e');
    }
  }
}
