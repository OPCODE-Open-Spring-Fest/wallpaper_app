import 'package:flutter/material.dart';
import '../localizations/app_localizations.dart';

class CategoryUtils {
  static String getLocalizedCategoryName(BuildContext context, String category) {
    final loc = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    switch (category.toLowerCase()) {
      case 'all':
        return loc.all;
      case 'nature':
        return loc.nature;
      case 'abstract':
        return loc.abstract;
      case 'urban':
        return loc.urban;
      case 'minimal':
        return loc.minimal;
      case 'space':
        return loc.space;
      case 'animals':
        return loc.animals;
      case 'art':
        return loc.art;
      case 'cars':
        return loc.cars;
      default:
        return category;
    }
  }
}
