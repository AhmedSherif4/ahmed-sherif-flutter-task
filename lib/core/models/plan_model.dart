import 'dart:convert';

class PlanModel {
  final int? id;
  final String name;
  final double price;
  final int viewsMultiplier;
  final String? offerLabel;
  final List<Map<String, String>> details; // قائمة تفاصيل (text + icon)

  PlanModel({
    this.id,
    required this.name,
    required this.price,
    required this.viewsMultiplier,
    required this.details,
    required this.offerLabel,
  });

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    final decodedDetails = map['details'] != null
        ? (jsonDecode(map['details']) as List)
              .map(
                (item) => Map<String, String>.from(
                  item.map(
                    (key, value) => MapEntry(key.toString(), value.toString()),
                  ),
                ),
              )
              .toList()
        : <Map<String, String>>[];
    return PlanModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      offerLabel: map['offer_label'] as String?,

      price: (map['price'] as num).toDouble(),
      viewsMultiplier: map['views_multiplier'] as int,
      details: decodedDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'views_multiplier': viewsMultiplier,
      'offer_label': offerLabel,
      'details': jsonEncode(details),
    };
  }
}
