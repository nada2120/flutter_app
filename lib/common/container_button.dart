import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xFFFCF3F6),
          border: Border.all(
              color: Color(0xFFF83758),
              width: 2
          ),
          borderRadius: BorderRadius.circular(108)
      ),
      child: Center(
        child: SvgPicture.asset(
          image,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}