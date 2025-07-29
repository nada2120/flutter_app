import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/common/custom_appbar.dart';
import 'package:team_project/constants/colors.dart';

import '../../../api/models/product_model.dart';
import '../../../constants/texts.dart';
import '../../../homePage/presentation/manager/bloc/cart_bloc.dart';
import '../../../homePage/presentation/manager/bloc/cart_event.dart';
import '../../../homePage/presentation/manager/bloc/cart_state.dart';
import '../widgets/cart_to_shopping.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Your bag',
      leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, navigationBarMenu);
          },
          icon: Icon(Icons.arrow_back_ios, color: primaryColor,)
      ),
      // actions:  BlocBuilder<CartBloc, CartState>(
      //   builder: (context, state) {
      //     if (state.items.isNotEmpty) {
      //       return IconButton(
      //         onPressed: () {
      //           context.read<CartBloc>().add(ClearCart());
      //         },
      //         icon: const Icon(Icons.delete, color: Colors.white, size: 24),
      //       );
      //     } else {
      //       return const SizedBox();
      //     }
      //   },
      // ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            final items = state.items.entries.toList();
            final totalPrice = state.totalPrice;

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final entry = items[index];
                      final product = state.allProducts.firstWhere(
                              (p) => p.id == entry.key.id);
                      final quantity = entry.value;

                      return CartToShopping(product: product, quantity: quantity);
                    },
                  ),
                ),
               // const Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor
                      ),
                      child: Text('Check Out', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),)
                  ),
                ),
                const SizedBox(height: 8),

              ],
            );
          }
        },
      ),
    );
  }
}

