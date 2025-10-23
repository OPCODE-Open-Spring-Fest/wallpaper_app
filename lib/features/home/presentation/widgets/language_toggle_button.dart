import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_wallpaper_company/core/providers/language_provider.dart';
// import '../providers/language_provider.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        // Display text for the currently selected language
        String displayText;
        Color textColor;
//language toggle button 
        switch (languageProvider.currentLocale.languageCode) {
          case 'hi':
            displayText = 'हि';
            textColor = Colors.blue;
            break;
          case 'en':
            displayText = 'EN';
            textColor = Colors.orange;
            break;
          case 'es':
            displayText = 'ES';
            textColor = Colors.green;
            break;
          case 'ja':
            displayText = 'JA';
            textColor = Colors.red;
            break;
          default:
            displayText = 'EN';
            textColor = Colors.orange;
        }

        return Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () => languageProvider.toggleLanguage(), // cycles language
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  displayText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
