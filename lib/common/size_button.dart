import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/texts.dart';

class SizeButton extends StatefulWidget {
  const SizeButton({super.key});

  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  String selectedSize = "";
  final Color defaultColor = primaryColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: sizes.map((size) => buildSizeButton(size)).toList(),
    );
  }

  Widget buildSizeButton(String size) {
    final bool isSelected = size == selectedSize;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedSize = size;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.white : defaultColor,
        side: BorderSide(color: defaultColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? defaultColor : Colors.white,
        ),
      ),
    );
  }
}
