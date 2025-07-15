import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
               style: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.bold
             ),
            ),
       subtitle: Text(subtitle, style: TextStyle(fontSize: 16),),
    );
  }
}


//
// SizedBox(height: 4,),
// Text(data, style: TextStyle(fontSize: 16),),