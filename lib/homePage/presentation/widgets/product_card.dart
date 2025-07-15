import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_bloc.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_event.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_state.dart';

import '../../../common/row_counter.dart';
import '../../../constants/strings.dart';
import '../../../constants/texts.dart';
import '../../../models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: NTexts.products.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = NTexts.products[index];
        return GestureDetector(
          onTap: () {
         Navigator.pushNamed(
             context,
             productDetailsScreen,
           arguments: product
         );
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  child: Image.asset(product.image, fit: BoxFit.fill),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$${product.price}'),
                          BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              //final items = state.items.entries.toList();
                              final quantity = state.items[product] ?? 0;
                            //  final product = items[index].key;
                              if (quantity == 0) {
                                return SizedBox(
                                  height: 35,
                                  child: ElevatedButton(
                                    onPressed: () async{
                                      final box = Hive.box<Product>('products');
                                      await box.add(product);
                                      context.read<CartBloc>().add(AddToCart(product));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFF83758),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Add',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                );
                              } else {
                                return FittedBox(
                                  child: RowCounter(
                                    quantity: quantity,
                                    onIncrease: (){context.read<CartBloc>().add(IncrementQuantity(product));},
                                    onDecrease: (){context.read<CartBloc>().add(DecrementQuantity(product));},
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}