class ProductModel {
  final int? id;
  final String image;
  final String name;
  final double priceBefore;
  final double priceAfter;
  final double salesCount;
  final int categoryId;

  ProductModel({
    this.id,
    required this.image,
    required this.name,
    required this.priceBefore,
    required this.priceAfter,
    required this.salesCount,
    required this.categoryId,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int?,
      image: map['image'] as String,
      name: map['name'] as String,
      priceBefore: (map['price_before'] as num).toDouble(),
      priceAfter: (map['price_after'] as num).toDouble(),
      salesCount: map['sales_count'] as double,
      categoryId: map['category_id'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'price_before': priceBefore,
      'price_after': priceAfter,
      'sales_count': salesCount,
      'category_id': categoryId,
    };
  }
}
