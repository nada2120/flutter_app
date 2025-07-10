import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/container_button.dart';

class SocialMediaButtons extends StatefulWidget {
  const SocialMediaButtons({super.key});

  @override
  State<SocialMediaButtons> createState() => _SocialMediaButtonsState();
}

class _SocialMediaButtonsState extends State<SocialMediaButtons> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContainerButton(image: 'assets/images/google 1.svg',),
        SizedBox(width: 8,),
       ContainerButton(image: 'assets/images/apple.svg'),
        SizedBox(width: 8,),
       ContainerButton(image:  'assets/images/facebook.svg')
      ],
    );
  }
}


