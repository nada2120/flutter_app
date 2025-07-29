import 'package:badges/badges.dart' as badges;
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
                badges.Badge(
                  badgeContent: Text(
                    '$totalQuantity',
                    style: TextStyle(color: Colors.white),
                  ),
                  position: badges.BadgePosition.topEnd(top: -10, end: -12),
                  badgeAnimation: badges.BadgeAnimation.scale(
                    animationDuration: Duration(milliseconds: 300),
                    loopAnimation: false,
                  ),
                  child: Icon(Icons.shopping_cart),
                ),

            ],
          ),
        );
      },
    );
  }
}
