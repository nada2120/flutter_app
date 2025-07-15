import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../homePage/presentation/manager/bloc/cart_bloc.dart';
import '../homePage/presentation/manager/bloc/cart_event.dart';
import '../models/product_model.dart';

class RowCounter extends StatelessWidget {
   RowCounter({
    super.key,
    required this.quantity,
    this.widthContainer = 25,
    this.heightContainer = 25,
    this.sizeIcon = 18,
     required this.onIncrease,
     required this.onDecrease,
  });

  final int quantity;
  final double widthContainer;
  final double heightContainer;
  final double sizeIcon;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;


   @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onDecrease,
            icon: Icon(Icons.remove, size: sizeIcon,),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
          //  SizedBox(width: 4,),
          Container(
            width: widthContainer,
            height: heightContainer,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xFFF83758),
                  width: 2
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(child: Text(quantity.toString())),
          ),
          //SizedBox(width: 4,),
          IconButton(
            onPressed: onDecrease,
            icon: Icon(Icons.add, size: sizeIcon,),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }
}