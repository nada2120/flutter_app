import 'package:flutter/material.dart';

import '../../../constants/texts.dart';

class PictureOfFeatured extends StatelessWidget {
  const PictureOfFeatured();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: Image.asset(featured[0]['image'],
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12)
                ),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        featured[0]['title'],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        featured[0]['subtitle'],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12
                        ),
                      ),
                    ]
                )

            )
        )
      ],
    );
  }
}