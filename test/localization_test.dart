import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:the_wallpaper_company/core/providers/language_provider.dart';
import 'package:the_wallpaper_company/core/localizations/app_localizations.dart';
import 'package:the_wallpaper_company/features/home/presentation/widgets/language_toggle_button.dart';

void main() {
  group('Localization Tests', () {
    testWidgets('AppLocalizations should provide English strings', (
      WidgetTester tester,
    ) async {
      final localizations = AppLocalizations(const Locale('en'));

      expect(localizations.appTitle, 'The Wallpaper Co.');
      expect(localizations.home, 'Home');
      expect(localizations.favorites, 'Favorites');
      expect(
        localizations.searchHint,
        'Search wallpapers by title or category...',
      );
    });

    testWidgets('AppLocalizations should provide Hindi strings', (
      WidgetTester tester,
    ) async {
      final localizations = AppLocalizations(const Locale('hi'));

      expect(localizations.appTitle, 'द वॉलपेपर कंपनी');
      expect(localizations.home, 'होम');
      expect(localizations.favorites, 'पसंदीदा');
      expect(
        localizations.searchHint,
        'शीर्षक या श्रेणी द्वारा वॉलपेपर खोजें...',
      );
    });

    testWidgets('LanguageProvider should toggle between languages correctly', (
      WidgetTester tester,
    ) async {
      final languageProvider = LanguageProvider();

      // Initial state should be English
      expect(languageProvider.currentLocale.languageCode, 'en');
      expect(languageProvider.isEnglish, true);
      expect(languageProvider.isHindi, false);

      // Toggle to Hindi
      languageProvider.toggleLanguage();
      expect(languageProvider.currentLocale.languageCode, 'hi');
      expect(languageProvider.isEnglish, false);
      expect(languageProvider.isHindi, true);

      // Toggle back to English
      languageProvider.toggleLanguage();
      expect(languageProvider.currentLocale.languageCode, 'en');
      expect(languageProvider.isEnglish, true);
      expect(languageProvider.isHindi, false);
    });

    testWidgets(
      'LanguageToggleButton should display correct text for English',
      (WidgetTester tester) async {
        final languageProvider = LanguageProvider();

        await tester.pumpWidget(
          MaterialApp(
            home: ChangeNotifierProvider.value(
              value: languageProvider,
              child: const Scaffold(body: LanguageToggleButton()),
            ),
          ),
        );

        // Should show Hindi indicator when in English mode
        expect(find.text('हि'), findsOneWidget);
      },
    );

    testWidgets('LanguageToggleButton should display correct text for Hindi', (
      WidgetTester tester,
    ) async {
      final languageProvider = LanguageProvider();
      languageProvider.setLanguage(const Locale('hi')); // Set to Hindi

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: languageProvider,
            child: const Scaffold(body: LanguageToggleButton()),
          ),
        ),
      );

      await tester.pump(); // Allow for animations

      // Should show English indicator when in Hindi mode
      expect(find.text('EN'), findsOneWidget);
    });

    testWidgets('LanguageToggleButton tap should toggle language', (
      WidgetTester tester,
    ) async {
      final languageProvider = LanguageProvider();

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: languageProvider,
            child: const Scaffold(body: LanguageToggleButton()),
          ),
        ),
      );

      // Initial state - English
      expect(languageProvider.isEnglish, true);

      // Tap the toggle button
      await tester.tap(find.byType(LanguageToggleButton));
      await tester.pump();

      // Should now be Hindi
      expect(languageProvider.isHindi, true);

      // Tap again
      await tester.tap(find.byType(LanguageToggleButton));
      await tester.pump();

      // Should be back to English
      expect(languageProvider.isEnglish, true);
    });

    test('noResultsMessage should format query correctly in English', () {
      final localizations = AppLocalizations(const Locale('en'));
      expect(
        localizations.noResultsMessage('nature'),
        'No results for "nature"',
      );
    });

    test('noResultsMessage should format query correctly in Hindi', () {
      final localizations = AppLocalizations(const Locale('hi'));
      expect(
        localizations.noResultsMessage('प्रकृति'),
        '"प्रकृति" के लिए कोई परिणाम नहीं',
      );
    });
  });
}
