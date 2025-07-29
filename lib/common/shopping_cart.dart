import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/constants/colors.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_bloc.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_state.dart';

import '../constants/texts.dart';
import 'container_button.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final totalQuantity = state.totalQuantity;
        return IconButton(
          onPressed: () {
            Navigator.pushNamed(context, cartScreen);
          },
          icon: Stack(
            children: [
              const Icon(Icons.shopping_cart),
              if (totalQuantity > 0)
                Positioned(
                  left: 4,
                  bottom: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ContainerButton(
                      sizeContainer: 18,
                      colorContainer: primaryColor,
                      widget: Text(
                        '$totalQuantity',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
