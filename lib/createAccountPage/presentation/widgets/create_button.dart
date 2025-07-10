import 'package:flutter/material.dart';

import '../../../screens/home.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if(formKey.currentState!.validate()) {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => MyHome()
                )
            );
          }
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: 21, horizontal: 109),
            backgroundColor: Color(0xFFF83758),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4))),
        child: Text(
          'Create Account',
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
