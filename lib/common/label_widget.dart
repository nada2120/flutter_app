import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
   const LabelWidget({ required this.title, this.gap = 4, required this.widget});

  final String title;
  final double gap;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: gap,),
         widget
      ],
    );
  }
}


//
// SizedBox(height: 4,),
// Text(data, style: TextStyle(fontSize: 16),),

