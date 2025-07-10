import 'package:flutter/material.dart';

class MyDividerAccount extends StatelessWidget {
  const MyDividerAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            indent: 5,
            endIndent: 5,
            thickness: 1,
            color: Color(0xFF575757),
          ),
        ),
        Text(
          'OR Continue With',
          style: TextStyle(
              color: Color(0xFF575757),
              fontWeight: FontWeight.w500
          ),
        ),
        Flexible(
          child: Divider(
            indent: 5,
            endIndent: 5,
            thickness: 1,
            color: Color(0xFF575757),
          ),
        )
      ],
    );
  }
}
