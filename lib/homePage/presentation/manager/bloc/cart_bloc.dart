import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../api/models/product_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<Product> allProducts;

  CartBloc(this.allProducts) : super(CartState({}, allProducts)) {
    on<AddToCart>((event, emit) {
      print("Add to cart");
      final currentItems = Map<Product, int>.from(state.items);
      currentItems[event.product] = 1;
      emit(state.copyWith(items: currentItems));
    });

    on<IncrementQuantity>((event, emit) {
      final currentItems = Map<Product, int>.from(state.items);
      final currentQuantity = currentItems[event.product] ?? 0;
      currentItems[event.product] = currentQuantity + 1;
      emit(state.copyWith(items: currentItems));
    });

    on<DecrementQuantity>((event, emit) {
      final currentItems = Map<Product, int>.from(state.items);
      final currentQuantity = currentItems[event.product] ?? 0;
      if (currentQuantity > 1) {
        currentItems[event.product] = currentQuantity - 1;
      } else {
        currentItems.remove(event.product);
      }
      emit(state.copyWith(items: currentItems));
    });

    on<ClearCart>((event, emit) {
      emit(state.copyWith(items: {}));
    });
  }
}

