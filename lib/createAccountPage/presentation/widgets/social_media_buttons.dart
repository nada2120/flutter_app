import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team_project/constants/texts.dart';

import '../../../common/container_button.dart';

class SocialMediaButtons extends StatefulWidget {
  const SocialMediaButtons();

  @override
  State<SocialMediaButtons> createState() => _SocialMediaButtonsState();
}

class _SocialMediaButtonsState extends State<SocialMediaButtons> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            PictureSocialMedia.length,
            (index) {
              return ContainerButton(
                  sizeContainer: 60,
                  sizeBorder: 2,
                  colorBorder: Color(0xFFF83758),
                  widget:  SvgPicture.asset(
                    PictureSocialMedia[index],
                    width: 25,
                    height: 25,
                  ),
              );
            }
        )
         //  ContainerButton(image: 'assets/images/google 1.svg',),
         //  SizedBox(width: 8,),
         // ContainerButton(image: 'assets/images/apple.svg'),
         //  SizedBox(width: 8,),
         // ContainerButton(image:  'assets/images/facebook.svg')

      ),
    );
  }
}


