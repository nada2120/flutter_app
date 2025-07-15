import 'package:flutter/material.dart';
import 'package:team_project/common/container_button.dart';

import '../../../constants/texts.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ContainerButton(
                  sizeContainer: 100,
                  widget: Image.asset(
                    NTexts.categories[index]['image'],
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 4,),
                Text(NTexts.categories[index]['title'],)
              ],
            );
          }

      )
    );
  }
}
