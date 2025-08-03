import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String textButton;
  final VoidCallback onTap;
  const Button({super.key, required this.textButton, required this.onTap});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap();
      },
      style: ElevatedButton.styleFrom(

        backgroundColor: isSelected ? Colors.black : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      child: Text(widget.textButton),
    );
  }
}