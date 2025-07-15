import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../constants/strings.dart';
import '../homePage/presentation/manager/bloc/cart_bloc.dart';
import '../homePage/presentation/manager/bloc/cart_state.dart';
import 'container_button.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
          Navigator.pushNamed(context, cartScreen);
          },
          icon: const Icon(Iconsax.shopping_cart, color: Colors.white, size: 24,),
        ),
        Positioned(
            right: 1,
            top: 1,
            child: ContainerButton(
                sizeContainer: 18,
                colorContainer: Colors.black,
                widget:  BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    final totalQuantity = state.items.values.fold(0.0,
                        (sum, quantity) => sum + quantity
                    );
                    return Text(
                        '${totalQuantity}',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white
                        )
                    );
                  },
    
                )
            )
        )
      ],
    );
  }
}