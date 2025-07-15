import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_event.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_state.dart';
import 'package:team_project/models/product_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState({})){

    on<AddToCart>((event, emit){
      final updated = Map<Product, int>.from(state.items);
      if(updated.containsKey(event.product)) {
        updated[event.product] = updated[event.product]! + 1;
      } else {
        updated[event.product] =  1;
      } emit(CartState(updated));
    });

    on<IncrementQuantity>((event, emit){
      final updated = Map<Product, int>.from(state.items);
       updated[event.product] = (updated[event.product] ?? 0) + 1;
    });

    on<DecrementQuantity>((event, emit){
      final updated = Map<Product, int>.from(state.items);
      if(updated.containsKey(event.product)) {
        final currentProduct = updated[event.product]!;
        if(currentProduct > 1) {
          updated[event.product] = currentProduct - 1;
        } else {
          updated.remove(event.product);
        }
        emit(CartState(updated));
      }
      });
  }
}