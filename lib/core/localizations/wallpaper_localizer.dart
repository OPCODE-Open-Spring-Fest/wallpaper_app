import 'package:flutter/material.dart';
import 'app_localizations.dart';

class WallpaperLocalizer {
  static String getLocalizedWallpaperName(BuildContext context, String originalTitle) {
    final localizations = AppLocalizations.of(context)!;
    
    // Convert title to lowercase for comparison
    final lowerTitle = originalTitle.toLowerCase().trim();
    
    // Map common wallpaper titles to localized names
    final Map<String, String> titleMapping = {
      // Nature wallpapers
      'mountain': _getLocalizedText(context, 'Mountain', 'पहाड़'),
      'forest': _getLocalizedText(context, 'Forest', 'जंगल'),
      'ocean': _getLocalizedText(context, 'Ocean', 'समुद्र'),
      'sunset': _getLocalizedText(context, 'Sunset', 'सूर्यास्त'),
      'sunrise': _getLocalizedText(context, 'Sunrise', 'सूर्योदय'),
      'lake': _getLocalizedText(context, 'Lake', 'झील'),
      'river': _getLocalizedText(context, 'River', 'नदी'),
      'beach': _getLocalizedText(context, 'Beach', 'समुद्र तट'),
      'desert': _getLocalizedText(context, 'Desert', 'रेगिस्तान'),
      'waterfall': _getLocalizedText(context, 'Waterfall', 'झरना'),
      
      // Abstract wallpapers
      'abstract': _getLocalizedText(context, 'Abstract', 'अमूर्त'),
      'pattern': _getLocalizedText(context, 'Pattern', 'पैटर्न'),
      'geometric': _getLocalizedText(context, 'Geometric', 'ज्यामितीय'),
      'colorful': _getLocalizedText(context, 'Colorful', 'रंगबिरंगा'),
      'gradient': _getLocalizedText(context, 'Gradient', 'ग्रेडिएंट'),
      
      // Space wallpapers
      'galaxy': _getLocalizedText(context, 'Galaxy', 'आकाशगंगा'),
      'nebula': _getLocalizedText(context, 'Nebula', 'नेब्यूला'),
      'planet': _getLocalizedText(context, 'Planet', 'ग्रह'),
      'stars': _getLocalizedText(context, 'Stars', 'तारे'),
      'moon': _getLocalizedText(context, 'Moon', 'चाँद'),
      'earth': _getLocalizedText(context, 'Earth', 'पृथ्वी'),
      'space': _getLocalizedText(context, 'Space', 'अंतरिक्ष'),
      
      // Urban wallpapers
      'city': _getLocalizedText(context, 'City', 'शहर'),
      'skyline': _getLocalizedText(context, 'Skyline', 'आकाश रेखा'),
      'building': _getLocalizedText(context, 'Building', 'इमारत'),
      'street': _getLocalizedText(context, 'Street', 'सड़क'),
      'architecture': _getLocalizedText(context, 'Architecture', 'वास्तुकला'),
      'bridge': _getLocalizedText(context, 'Bridge', 'पुल'),
      'night city': _getLocalizedText(context, 'Night City', 'रात का शहर'),
      
      // Animals
      'cat': _getLocalizedText(context, 'Cat', 'बिल्ली'),
      'dog': _getLocalizedText(context, 'Dog', 'कुत्ता'),
      'tiger': _getLocalizedText(context, 'Tiger', 'बाघ'),
      'lion': _getLocalizedText(context, 'Lion', 'शेर'),
      'elephant': _getLocalizedText(context, 'Elephant', 'हाथी'),
      'bird': _getLocalizedText(context, 'Bird', 'पक्षी'),
      'eagle': _getLocalizedText(context, 'Eagle', 'चील'),
      'wolf': _getLocalizedText(context, 'Wolf', 'भेड़िया'),
      
      // Minimal
      'minimal': _getLocalizedText(context, 'Minimal', 'न्यूनतम'),
      'simple': _getLocalizedText(context, 'Simple', 'सरल'),
      'clean': _getLocalizedText(context, 'Clean', 'साफ'),
      'white': _getLocalizedText(context, 'White', 'सफेद'),
      'black': _getLocalizedText(context, 'Black', 'काला'),
      
      // Art
      'painting': _getLocalizedText(context, 'Painting', 'चित्र'),
      'artwork': _getLocalizedText(context, 'Artwork', 'कलाकृति'),
      'drawing': _getLocalizedText(context, 'Drawing', 'चित्रकला'),
      'sketch': _getLocalizedText(context, 'Sketch', 'स्केच'),
      
      // Cars
      'car': _getLocalizedText(context, 'Car', 'कार'),
      'sports car': _getLocalizedText(context, 'Sports Car', 'स्पोर्ट्स कार'),
      'luxury car': _getLocalizedText(context, 'Luxury Car', 'लक्जरी कार'),
      'vintage car': _getLocalizedText(context, 'Vintage Car', 'विंटेज कार'),
      'motorcycle': _getLocalizedText(context, 'Motorcycle', 'मोटरसाइकिल'),
    };
    
    // Try exact match first
    if (titleMapping.containsKey(lowerTitle)) {
      return titleMapping[lowerTitle]!;
    }
    
    // Try partial matches for compound titles
    for (final entry in titleMapping.entries) {
      if (lowerTitle.contains(entry.key) || entry.key.contains(lowerTitle)) {
        return entry.value;
      }
    }
    
    // If no match found, return original title
    return originalTitle;
  }
  
  static String _getLocalizedText(BuildContext context, String englishText, String hindiText) {
    final locale = Localizations.localeOf(context);
    return locale.languageCode == 'hi' ? hindiText : englishText;
  }
  
  // Helper method to get localized category display name
  static String getLocalizedCategoryName(BuildContext context, String category) {
    final localizations = AppLocalizations.of(context)!;
    final lowerCategory = category.toLowerCase().trim();
    
    switch (lowerCategory) {
      case 'nature':
        return localizations.nature;
      case 'abstract':
        return localizations.abstract;
      case 'urban':
        return localizations.urban;
      case 'minimal':
        return localizations.minimal;
      case 'space':
        return localizations.space;
      case 'animals':
        return localizations.animals;
      case 'art':
        return localizations.art;
      case 'cars':
        return localizations.cars;
      case 'all':
        return localizations.all;
      default:
        return category;
    }
  }
}