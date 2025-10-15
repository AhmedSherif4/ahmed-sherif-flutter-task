class CategoryModel {
  final int? id;
  final String name;
  final String? image;

  CategoryModel({this.id, required this.name, this.image});

  // تحويل من Map (جاي من SQLite) إلى Model
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      image: map['image'] as String?,
    );
  }

  // تحويل من Model إلى Map (للحفظ في SQLite)
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'image': image};
  }
}
