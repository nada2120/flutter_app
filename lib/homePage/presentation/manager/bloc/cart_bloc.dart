import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
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
      saveCartToStorage(currentItems);
      emit(state.copyWith(items: currentItems));
    });

    on<IncrementQuantity>((event, emit) {
      final currentItems = Map<Product, int>.from(state.items);
      final currentQuantity = currentItems[event.product] ?? 0;
      currentItems[event.product] = currentQuantity + 1;
      saveCartToStorage(currentItems);
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
      saveCartToStorage(currentItems);
      emit(state.copyWith(items: currentItems));
    });

    on<ClearCart>((event, emit) {
      saveCartToStorage({});
      emit(state.copyWith(items: {}));
    });

    loadCartFromStorage();
  }

  Future<void> loadCartFromStorage() async {
    final box = Hive.box<Product>('cart');
    final storedMap = box.get('items') as Map?;
    final items = <Product, int>{};

    storedMap?.forEach((key, value) {
      if (key is Product && value is int) {
        items[key] = value;
      }
    });

    emit(state.copyWith(items: items));
  }

  void saveCartToStorage(Map<Product, int> items) async {
    final box = Hive.box<Product>('cart');

    await box.clear();

    for (var entry in items.entries) {
      await box.add(entry.key);
    }
  }}