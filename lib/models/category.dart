class Category {
  final String id;
  final String name;
  final String thumbnailURL;

  const Category({
    required this.id,
    required this.name,
    required this.thumbnailURL,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['idCategory'],
        name: json['strCategory'],
        thumbnailURL: json['strCategoryThumb']);
  }
}
