import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'product_model.g.dart';

  @HiveType(typeId: 0)
class Product extends HiveObject with EquatableMixin{
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String details;
  @HiveField(3)
  final double price;

  Product({
    required this.image,
    required this.name,
    required this.details,
    required this.price
  });

  @override
  List<Object?> get props => [name];

}