import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'category_model.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final List<String> images;

  @HiveField(5)
  final Category category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });

  factory Product.fromjson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      price: (json["price"] as num).toDouble(),
      description: json["description"],
      images: List<String>.from(json["images"] ?? []),
      category: Category.fromjson(json["category"]),
    );
  }

  @override
  List<Object?> get props => [id, title, price, description, images, category];
}