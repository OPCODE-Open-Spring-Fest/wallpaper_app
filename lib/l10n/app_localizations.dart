import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'The Wallpaper Co.'**
  String get appTitle;

  /// Hint text for search bar
  ///
  /// In en, this message translates to:
  /// **'Search wallpapers by title or category...'**
  String get searchHint;

  /// Home tab label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Favorites tab label
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// Categories section label
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// All categories option
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Nature category
  ///
  /// In en, this message translates to:
  /// **'Nature'**
  String get nature;

  /// Abstract category
  ///
  /// In en, this message translates to:
  /// **'Abstract'**
  String get abstract;

  /// Urban category
  ///
  /// In en, this message translates to:
  /// **'Urban'**
  String get urban;

  /// Minimal category
  ///
  /// In en, this message translates to:
  /// **'Minimal'**
  String get minimal;

  /// Space category
  ///
  /// In en, this message translates to:
  /// **'Space'**
  String get space;

  /// Animals category
  ///
  /// In en, this message translates to:
  /// **'Animals'**
  String get animals;

  /// Technology category
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technology;

  /// Art category
  ///
  /// In en, this message translates to:
  /// **'Art'**
  String get art;

  /// Title when no search results are found
  ///
  /// In en, this message translates to:
  /// **'No wallpapers found'**
  String get noResultsTitle;

  /// Message when no search results are found
  ///
  /// In en, this message translates to:
  /// **'No results for \"{query}\"'**
  String noResultsMessage(String query);

  /// Button to clear search
  ///
  /// In en, this message translates to:
  /// **'Clear Search'**
  String get clearSearch;

  /// Download button text
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// Set wallpaper button text
  ///
  /// In en, this message translates to:
  /// **'Set Wallpaper'**
  String get setWallpaper;

  /// Share button text
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// Add to favorites button text
  ///
  /// In en, this message translates to:
  /// **'Add to Favorites'**
  String get addToFavorites;

  /// Remove from favorites button text
  ///
  /// In en, this message translates to:
  /// **'Remove from Favorites'**
  String get removeFromFavorites;

  /// Success message when wallpaper is downloaded
  ///
  /// In en, this message translates to:
  /// **'Downloaded successfully'**
  String get downloadSuccess;

  /// Error message when download fails
  ///
  /// In en, this message translates to:
  /// **'Download failed'**
  String get downloadFailed;

  /// Success message when wallpaper is set
  ///
  /// In en, this message translates to:
  /// **'Wallpaper set successfully'**
  String get wallpaperSet;

  /// Error message when setting wallpaper fails
  ///
  /// In en, this message translates to:
  /// **'Failed to set wallpaper'**
  String get wallpaperSetFailed;

  /// Loading text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Error title
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Network error message
  ///
  /// In en, this message translates to:
  /// **'Network error occurred'**
  String get networkError;

  /// Language selection label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Hindi language option
  ///
  /// In en, this message translates to:
  /// **'हिंदी'**
  String get hindi;

  /// Settings title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// About section
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// App version label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Developer label
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// Pull to refresh instruction
  ///
  /// In en, this message translates to:
  /// **'Pull to refresh'**
  String get pullToRefresh;

  /// Release to refresh instruction
  ///
  /// In en, this message translates to:
  /// **'Release to refresh'**
  String get releaseToRefresh;

  /// Refreshing status text
  ///
  /// In en, this message translates to:
  /// **'Refreshing...'**
  String get refreshing;

  /// Message when no favorites are saved
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavorites;

  /// Detailed message when no favorites are saved
  ///
  /// In en, this message translates to:
  /// **'Add some wallpapers to your favorites to see them here'**
  String get noFavoritesMessage;

  /// Mountain wallpaper name
  ///
  /// In en, this message translates to:
  /// **'Mountain'**
  String get mountain;

  /// Forest wallpaper name
  ///
  /// In en, this message translates to:
  /// **'Forest'**
  String get forest;

  /// Ocean wallpaper name
  ///
  /// In en, this message translates to:
  /// **'Ocean'**
  String get ocean;

  /// Sunset wallpaper name
  ///
  /// In en, this message translates to:
  /// **'Sunset'**
  String get sunset;

  /// Sunrise wallpaper name
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get sunrise;

  /// Galaxy wallpaper name
  ///
  /// In en, this message translates to:
  /// **'Galaxy'**
  String get galaxy;

  /// City wallpaper name
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
