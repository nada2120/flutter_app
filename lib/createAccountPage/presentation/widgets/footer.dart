import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:team_project/screens/login.dart';

class MyFooterAccount extends StatelessWidget {
  const MyFooterAccount();

  @override
  Widget build(BuildContext context) {
    return   Text.rich(
      TextSpan(children: [
        TextSpan(
            text: 'I Already Have an Account ',
            style: TextStyle(
                color: Color(0xFF575757),
                fontWeight: FontWeight.w400,
                fontSize: 14
            )
        ),
        TextSpan(
            text: 'Login',
            style: TextStyle(
                color: Color(0xFFF83758),
                fontWeight: FontWeight.w600,
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationColor: Color(0xFFF83758)
            ),
            // recognizer: TapGestureRecognizer()..onTap = () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => Login())
            //   );
            // }
        ),

      ]
      ),
    );
  }
}
