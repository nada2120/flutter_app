import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/common/custom_appbar.dart';
import 'package:team_project/constants/colors.dart';
import 'package:team_project/favoritePage/presentation/manager/favorite_cubit.dart';
import 'package:team_project/favoritePage/presentation/manager/favorite_state.dart';
import 'package:team_project/common/gridview_card.dart';
import '../../../common/fav_button.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          title: 'Favorite',
          // actions: BlocBuilder<FavoriteCubit, FavoriteState>(
          //   builder: (context, state) {
          //     if (state.favorites.isNotEmpty) {
          //       return IconButton(
          //         onPressed: () {
          //           context.read<FavoriteCubit>().clearFavorite();
          //         },
          //         icon: const Icon(Icons.delete, color: Colors.white, size: 24),
          //       );
          //     } else {
          //       return const SizedBox();
          //     }
          //   },
          // ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state.favorites.isEmpty) {
              return const Center(
                child: Text(
                  'Your favorite is empty.',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else {
              final items = state.favorites.toList();
              return GridViewCard(
                  products: items,
                  imageBuilder: (product) {
                    return Stack(
                      children: [
                        Image.network(product.images[0], fit: BoxFit.fill, width: double.infinity,),
                        Positioned(
                            top: 4,
                            right: 3,
                            child: FavButton(product: product,)
                        )
                      ],
                    );
                  },
                 
              );
            }
          },
        ),
      ),
    );
  }
}