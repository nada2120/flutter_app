import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    required this.sizeContainer,
    this.sizeBorder = 0,
    required this.widget,
    this.colorBorder = Colors.white,
    this.colorContainer = Colors.white
  });

  final double sizeContainer;
  final double sizeBorder;
  final Color colorBorder;
  final Widget widget;
  final Color colorContainer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: sizeContainer,
        height: sizeContainer,
        //padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: colorContainer,
            border: Border.all(
                color: colorBorder,
                width: sizeBorder
            ),
            borderRadius: BorderRadius.circular(108)
        ),
        child: Center(child: widget)
      ),
    );
  }
}