import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/wallpaper_provider.dart';
import 'theme_toggle_button.dart';
import 'language_toggle_button.dart';
import '../../../../core/localizations/app_localizations.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<WallpaperProvider>(context, listen: false);
    _searchController.text = provider.searchQuery;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WallpaperProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[800]?.withValues(alpha: 0.8)
                        : Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    onChanged: (value) {
                      provider.updateSearchQuery(value);
                    },
                    decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context)?.searchHint ??
                          'Search wallpapers by title or category...',
                      hintStyle: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[400]
                            : Colors.grey[600],
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        provider.searchQuery.isNotEmpty
                            ? Icons.search
                            : Icons.search,
                        color: provider.searchQuery.isNotEmpty
                            ? Colors.pinkAccent
                            : (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey[400]
                                  : Colors.grey[600]),
                        size: 24,
                      ),
                      suffixIcon: provider.searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.grey[400]
                                    : Colors.grey[600],
                                size: 20,
                              ),
                              onPressed: () {
                                _searchController.clear();
                                provider.clearSearch();
                                _focusNode.unfocus();
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const LanguageToggleButton(),
              const SizedBox(width: 8),
              const ThemeToggleButton(),
            ],
          ),
        );
      },
    );
  }
}
