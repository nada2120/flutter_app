import 'package:flutter/material.dart';

class SizeButton extends StatefulWidget {
  final List<String> itemButtons;
  final Color defaultColor;

  SizeButton({
    super.key,
    required this.itemButtons,
    this.defaultColor = const Color(0xFFF83758),
  });

  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  String selectedSize = "";

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: widget.itemButtons.map((size) => buildSizeButton(size)).toList(),
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
        backgroundColor: isSelected ? widget.defaultColor : Colors.white,
        side: BorderSide(color: widget.defaultColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? Colors.white : widget.defaultColor,
        ),
      ),
    );
  }
}