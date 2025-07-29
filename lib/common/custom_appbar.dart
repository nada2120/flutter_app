import 'package:flutter/material.dart';
import 'package:team_project/common/shopping_cart.dart';

import '../constants/colors.dart';
import '../constants/texts.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  //final Widget actions;
  final Widget leading;

  @override
  final Size preferredSize;

   CustomAppbar({
    super.key,
    required this.title,
   // Widget? actions,
    Widget? leading,
  })  :
        leading = leading ?? const SizedBox(),
        preferredSize = const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: leading,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, favoritePage);
                      },
                      icon: Icon(Icons.favorite_outline)
                  ),
                  SizedBox(width: 4,),
                  ShoppingCart()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}