

import '../../../api/models/product_model.dart';

class FavoriteState {
  final Set<Product> favorites;

  const FavoriteState({required this.favorites});

  FavoriteState copyWith({Set<Product>? favorites}) {
    return FavoriteState(favorites: favorites ?? this.favorites);
  }
}

