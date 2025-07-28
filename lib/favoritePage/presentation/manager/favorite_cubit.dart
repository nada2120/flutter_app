import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../api/models/product_model.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState(favorites: {}));

  void toggleFavorite(Product product) {
    final currentProducts = Set<Product>.from(state.favorites);

    if (currentProducts.contains(product)) {
      currentProducts.remove(product);
    } else {
      currentProducts.add(product);
    }

    emit(FavoriteState(favorites: currentProducts));
  }

  bool isFavorite(Product product) {
    return state.favorites.contains(product);
  }

  void clearFavorite() {
    emit(const FavoriteState(favorites: {}));
  }
}