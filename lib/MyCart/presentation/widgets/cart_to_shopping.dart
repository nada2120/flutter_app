import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/models/product_model.dart';
import '../../../common/row_counter.dart';
import '../../../homePage/presentation/manager/bloc/cart_bloc.dart';
import '../../../homePage/presentation/manager/bloc/cart_event.dart';

class CartToShopping extends StatelessWidget {
  const CartToShopping({
    super.key,
    required this.product,
    required this.quantity,
  });

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.grey
            )
          ),
          color: Colors.transparent,
        ),

        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.images[0],
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: TextStyle(fontSize: 16),),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowCounter(
                          quantity: quantity,
                          widthContainer: 20,
                          heightContainer: 20,
                          sizeIcon: 16,
                          onIncrease: () {
                            context.read<CartBloc>().add(IncrementQuantity(product));
                          },
                          onDecrease: () {
                            context.read<CartBloc>().add(DecrementQuantity(product));
                          },
                        ),
                        Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 16),),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}