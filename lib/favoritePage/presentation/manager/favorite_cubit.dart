import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../api/models/product_model.dart';
import 'favorite_state.dart';


class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState(favorites: {})) {
    loadedFavorites();
  }

  final Box box = Hive.box("favorites");



  void loadedFavorites() {
    final stored = box.get("items") as List?;
    final fav = <Product>{};

   stored?.forEach((item){
     if(item is Product) {
       fav.add(item);
     }
   });
    emit(state.copyWith(favorites: fav));
  }

void clearFavorite() {
  final box = Hive.box('favorites');
  box.delete('items');
  emit(state.copyWith(favorites: {}));
}


  void toggleFavorite(Product product) {
    final currentProducts = Set<Product>.from(state.favorites);

    if(currentProducts.contains(product)) {
      currentProducts.remove(product);
    } else {
      currentProducts.add(product);
    }
    box.put("items", currentProducts.toList());
    emit(FavoriteState(favorites: currentProducts));
  }

  bool isFavorite(Product product) {
    return state.favorites.contains(product);
  }
}