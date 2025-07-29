import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/api/models/product_model.dart';
import 'package:team_project/common/row_counter.dart';
import '../homePage/presentation/manager/bloc/cart_bloc.dart';
import '../homePage/presentation/manager/bloc/cart_event.dart';
import '../homePage/presentation/manager/bloc/cart_state.dart';

class ButtonAdd extends StatelessWidget {
  final Product product;
  final bool useFlexible;
  final double widthContainer;
  final double heightContainer;
  final double sizeIcon;
  final String addButtonText;

  const ButtonAdd({
    super.key,
    required this.product,
    this.useFlexible = false,
    this.addButtonText = "Add",
    this.widthContainer = 20,
    this.heightContainer = 20,
    this.sizeIcon = 16,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final quantity = state.items[product] ?? 0;

        final child = SizedBox(
          height: 30,
          child: quantity == 0
              ? ElevatedButton(
            onPressed: () {
              context.read<CartBloc>().add(AddToCart(product));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF83758),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              addButtonText,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          )
              : Center(
                child: RowCounter(
                            quantity: quantity,
                            widthContainer: widthContainer,
                            heightContainer: heightContainer,
                            sizeIcon: sizeIcon,
                            onIncrease: () {
                context.read<CartBloc>().add(IncrementQuantity(product));
                            },
                            onDecrease: () {
                context.read<CartBloc>().add(DecrementQuantity(product));
                            },
                          ),
              ),
        );

        return useFlexible ? Flexible(child: child) : child;
      },
    );
  }
}