import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/common/text_text.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_bloc.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_event.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_state.dart';
import '../../../common/row_counter.dart';
import '../../../common/shopping_cart.dart';
import '../../../constants/strings.dart';
import '../../../models/product_model.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF83758),
        centerTitle: true,
        title: Text('Product Details',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
          actions: [
          ShoppingCart()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           MyText(title: 'Name', subtitle: product.name),
            SizedBox(height: 8,),
            Image.asset(product.image),
            SizedBox(height: 8,),
           MyText(title: 'Price', subtitle: '\$${product.price}'),
            SizedBox(height: 8,),
            MyText(title: 'Details', subtitle: product.details),
            SizedBox(height: 8,),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                final quantity = state.items[product] ?? 0;
                 return MyText(title: 'Total Price', subtitle: '\$${product.price * quantity}');}
            ),
            SizedBox(height: 8,),
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              final quantity = state.items[product] ?? 0;
              return Center(
              child: RowCounter(
                quantity: quantity,
                widthContainer: 200,
                heightContainer: 30,
                sizeIcon: 24,
                onIncrease: (){context.read<CartBloc>().add(IncrementQuantity(product));},
                onDecrease: (){context.read<CartBloc>().add(DecrementQuantity(product));},
              ),
            );})
          ],
        ),
      ),
    );
  }
}
