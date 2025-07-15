import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/common/text_text.dart';
import '../../../common/row_counter.dart';
import '../../../constants/strings.dart';
import '../../../homePage/presentation/manager/bloc/cart_bloc.dart';
import '../../../homePage/presentation/manager/bloc/cart_event.dart';
import '../../../homePage/presentation/manager/bloc/cart_state.dart';

class MyCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF83758),
        centerTitle: true,
        title: Text('Shopping Cart',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => DeletePage()));
            },
            icon: const Icon(Icons.delete, color: Colors.white, size: 24,),
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if(state.items.isEmpty) {
              return Text('is empty');
            } else {
              final items = state.items.entries.toList();
             final totalPrice = state.totalPrice;
             return Column(
               children: [
                 Expanded(
                     child: ListView.builder(
                       itemCount: items.length,
                         itemBuilder: (context, index) {
                         final product = items[index].key;
                         final quantity = items[index].value;
                         return Card(
                           color: Colors.white,
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                 Image(image: AssetImage(product.image), width: 150, height: 150,),
                                 SizedBox(width: 4,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     MyText(title: 'Name', subtitle: product.name),
                                     Row(
                                       children: [
                                         MyText(title: 'Price', subtitle: '\$${product.price}'),
                                         SizedBox(width: 4,),
                                         BlocBuilder<CartBloc, CartState>(builder: (context, state) => Center(
                                           child: RowCounter(
                                             quantity: quantity,
                                             onIncrease: (){context.read<CartBloc>().add(IncrementQuantity(product));},
                                             onDecrease: (){context.read<CartBloc>().add(DecrementQuantity(product));},
                                           ),
                                         ))

                                       ],
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         );
                         }
                     )
                 ),
            Divider(
            indent: 5,
            endIndent: 5,
            thickness: 1,
            color: Color(0xFF575757),
            )
               ],
             );
            }
          }
      ),
    );
  }
}


/*
Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image(image: AssetImage(product.image), width: 150, height: 150,),
                       SizedBox(width: 4,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           MyText(title: 'Name', subtitle: product.name),
                           Row(
                            children: [
                             MyText(title: 'Price', subtitle: '\$${product.price}'),
                              SizedBox(width: 4,),
                            BlocBuilder<CartBloc, CartState>(builder: (context, state) => Center(
                                child: RowCounter(
                                  quantity: state.items[product]!,
                                  onIncrease: (){context.read<CartBloc>().add(IncrementQuantity(product));},
                                  onDecrease: (){context.read<CartBloc>().add(DecrementQuantity(product));},
                                ),
                              ))

                            ],
                                               ),
                         ],
                       ),
                  ],
                ),
              ),
            )




          ],
        ),
      )
 */