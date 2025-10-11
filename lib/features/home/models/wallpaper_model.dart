class Wallpaper {
  final String id;
  final String title;
  final String imageUrl;
  final String category;

  Wallpaper({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.category,
  });

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'imageUrl': imageUrl,
        'category': category,
      };
}