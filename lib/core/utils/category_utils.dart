import 'package:flutter/material.dart';
import '../localizations/app_localizations.dart';

class CategoryUtils {
  static String getLocalizedCategoryName(
    BuildContext context,
    String categoryName,
  ) {
    final localizations = AppLocalizations.of(context);

    switch (categoryName.toLowerCase()) {
      case 'all':
        return localizations?.all ?? 'All';
      case 'nature':
        return localizations?.nature ?? 'Nature';
      case 'abstract':
        return localizations?.abstract ?? 'Abstract';
      case 'urban':
        return localizations?.urban ?? 'Urban';
      case 'minimal':
        return localizations?.minimal ?? 'Minimal';
      case 'space':
        return _getSpaceTranslation(context);
      case 'animals':
        return _getAnimalsTranslation(context);
      case 'art':
        return _getArtTranslation(context);
      case 'cars':
        return _getCarsTranslation(context);
      case 'technology':
        return _getTechnologyTranslation(context);
      default:
        return categoryName;
    }
  }

  static String _getSpaceTranslation(BuildContext context) {
    final locale = Localizations.localeOf(context);
    switch (locale.languageCode) {
      case 'hi':
        return 'अंतरिक्ष';
      default:
        return 'Space';
    }
  }

  static String _getAnimalsTranslation(BuildContext context) {
    final locale = Localizations.localeOf(context);
    switch (locale.languageCode) {
      case 'hi':
        return 'जानवर';
      default:
        return 'Animals';
    }
  }

  static String _getArtTranslation(BuildContext context) {
    final locale = Localizations.localeOf(context);
    switch (locale.languageCode) {
      case 'hi':
        return 'कला';
      default:
        return 'Art';
    }
  }

  static String _getCarsTranslation(BuildContext context) {
    final locale = Localizations.localeOf(context);
    switch (locale.languageCode) {
      case 'hi':
        return 'कारें';
      default:
        return 'Cars';
    }
  }

  static String _getTechnologyTranslation(BuildContext context) {
    final locale = Localizations.localeOf(context);
    switch (locale.languageCode) {
      case 'hi':
        return 'तकनीक';
      default:
        return 'Technology';
    }
  }
}
