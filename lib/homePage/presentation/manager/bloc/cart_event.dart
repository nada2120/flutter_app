import 'package:equatable/equatable.dart';
import 'package:team_project/api/models/product_model.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final Product product;
  const AddToCart(this.product);
  @override
  List<Object?> get props => [product];
}

class IncrementQuantity extends CartEvent {
  final Product product;
  const IncrementQuantity(this.product);
  @override
  List<Object?> get props => [product];
}

class DecrementQuantity extends CartEvent {
  final Product product;
  const DecrementQuantity(this.product);
  @override
  List<Object?> get props => [product];
}

class ClearCart extends CartEvent {}