import 'package:equatable/equatable.dart';
import 'package:team_project/models/product_model.dart';

abstract class CartEvent extends Equatable {

  const CartEvent();

  @override
  List<Object?> get props => [];

}

class AddToCart extends CartEvent {
  Product product;
  AddToCart(this.product);

  @override
  List<Object?> get props => [product];
}

class IncrementQuantity extends  CartEvent {
  Product product;
  IncrementQuantity(this.product);

  @override
  List<Object?> get props => [product];
}

class DecrementQuantity extends  CartEvent {
  Product product;
  DecrementQuantity(this.product);

  @override
  List<Object?> get props => [product];
}