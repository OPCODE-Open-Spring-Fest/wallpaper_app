import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');
  static const String _languagePreferenceKey = 'selectedLanguage';

  Locale get currentLocale => _currentLocale;

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
    if (_currentLocale.languageCode == 'en') {
      setLanguage(const Locale('hi'));
    } else {
      setLanguage(const Locale('en'));
    }
  }

  bool get isHindi => _currentLocale.languageCode == 'hi';
  bool get isEnglish => _currentLocale.languageCode == 'en';

  String get currentLanguageName {
    switch (_currentLocale.languageCode) {
      case 'hi':
        return 'हिंदी';
      case 'en':
      default:
        return 'English';
    }
  }

  Future<void> _loadLanguagePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString(_languagePreferenceKey) ?? 'en';
      _currentLocale = Locale(languageCode);
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

  static const List<Locale> supportedLocales = [Locale('en'), Locale('hi')];
}
