import 'package:equatable/equatable.dart';
import '../../../../api/models/product_model.dart';

class CartState extends Equatable {
  final Map<Product, int> items;
  final List<Product> allProducts;

  const CartState(this.items, this.allProducts);

  double get totalPrice {
    double total = 0;
    items.forEach((productId, quantity) {
      final product = allProducts.firstWhere(
            (p) => p.id == productId.id,
          orElse: () => productId
      );
      total += product.price * quantity;
    });
    return total;
  }

  int get totalQuantity {
    int total = 0;
    items.forEach((_, quantity) {
      total += quantity;
    });
    return total;
  }

  CartState copyWith({Map<Product, int>? items}) {
    return CartState(items ?? this.items, allProducts);
  }

  @override
  List<Object?> get props => [items, allProducts];
}