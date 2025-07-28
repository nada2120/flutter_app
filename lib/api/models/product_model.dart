import 'package:equatable/equatable.dart';
import 'category_model.dart';


class Product extends Equatable {

  final int id;

  final String title;

  final double price;

  final String description;

  final List<String> images;

  final Category category;

  const Product({
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