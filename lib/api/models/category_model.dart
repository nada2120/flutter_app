import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;

  final String name;

  final String image;

  const Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromjson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [id, name, image];
}