import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategoryCarousel extends StatelessWidget {
  final List<Map<String, String>> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryCarousel({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final selectedIndex = categories.indexWhere(
      (c) => c['name'] == selectedCategory,
    );
    return SizedBox(
      height: 140,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 140,
          viewportFraction: 0.38,
          enableInfiniteScroll: true,
          initialPage: selectedIndex > -1 ? selectedIndex : 0,
          enlargeCenterPage: true,
        ),
        items: categories.map((category) {
          final isSelected = category['name'] == selectedCategory;
          return GestureDetector(
            onTap: () => onCategorySelected(category['name']!),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 180,
              height: 120,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.transparent, width: 3),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      category['imageUrl'] ?? '',
                      width: 180,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        width: 180,
                        height: 120,
                        child: const Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  ),
                  if (!isSelected)
                    Container(
                      width: 180,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          colors: [Colors.transparent, Colors.black26],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 18,
                    left: 0,
                    right: 0,
                    child: Text(
                      category['name']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
