import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../screens/register.dart';

class TextRegister extends StatelessWidget {
  const TextRegister();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
            text: 'By clicking the ',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: Color(0xFF676767))),
        TextSpan(
            text: 'Register ',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Color(0xFFFF4B26)),
            // recognizer: TapGestureRecognizer()..onTap = () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => Register())
            //   );
           // }
        ),

        TextSpan(
            text: 'button, you agree to the public offer',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: Color(0xFF676767))),
      ]),
    );
  }
}