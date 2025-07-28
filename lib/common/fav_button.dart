
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/models/product_model.dart';
import '../constants/colors.dart';
import '../favoritePage/presentation/manager/favorite_cubit.dart';
import '../favoritePage/presentation/manager/favorite_state.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFav = state.favorites.contains(product);
        return IconButton(
          onPressed: () {
            context.read<FavoriteCubit>().toggleFavorite(product);
          },
          icon: Icon(isFav ? Icons.favorite : Icons.favorite_outline,
            color: primaryColor,
            size: 24,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        );
      },
    );
  }
}