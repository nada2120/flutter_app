import 'package:equatable/equatable.dart';
import 'package:team_project/models/product_model.dart';

class CartState extends Equatable{
  final Map<Product, int> items;
  final double totalPrice;

   CartState(this.items) : totalPrice =
     items.entries.map((e) => e.key.price * e.value).fold(0.0,
         (sum, item) => sum + item
     );

  CartState copyWith({Map<Product, int>? items}) {
    return CartState(items ?? this.items);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [items, totalPrice];

}