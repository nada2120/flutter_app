import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'container_button.dart';

class RowCounter extends StatelessWidget {
   RowCounter({super.key,
    required this.quantity,
    required this.widthContainer,
    required this.heightContainer ,
    required this.sizeIcon,
    required this.onIncrease,
    required this.onDecrease,
     this.sizeBorder = 0,
     this.colorContainer = Colors.transparent
  });

  final int quantity;
  final double widthContainer;
  final double heightContainer;
  final double sizeIcon;
  final double sizeBorder;
  final Color colorContainer;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        ContainerButton(
          sizeContainer: 30,
          colorContainer: primaryColor.withValues(alpha: 0.2),
          widget: IconButton(
            onPressed: onDecrease,
            icon: Icon(Icons.remove, size: sizeIcon, color: primaryColor),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          )
          ),

        //SizedBox(width: 4,),
        Container(
          width: widthContainer,
          height: heightContainer,
          decoration: BoxDecoration(
            border: Border.all(
              color: colorContainer,
              width: sizeBorder,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              quantity.toString(),
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
       // SizedBox(width: 4,),
        ContainerButton(
            sizeContainer: 30,
            colorContainer: primaryColor.withValues(alpha: 0.2),
            widget: IconButton(
              onPressed: onIncrease,
              icon: Icon(Icons.add, size: sizeIcon, color: primaryColor),
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
        )

      ],
    );
  }
}