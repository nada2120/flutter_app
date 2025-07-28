import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    required this.sizeContainer,
    this.sizeBorder = 0,
    required this.widget,
    this.colorBorder = Colors.transparent,
    this.colorContainer = Colors.white,
  });

  final double sizeContainer;
  final double sizeBorder;
  final Color colorBorder;
  final Widget widget;
  final Color colorContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeContainer,
      height: sizeContainer,
      decoration: BoxDecoration(
        color: colorContainer,
        border: Border.all(
          color: colorBorder,
          width: sizeBorder,
        ),
        shape: BoxShape.circle, // أضمن شكل دائري 100%
      ),
      child: Center(child: widget),
    );
  }
}