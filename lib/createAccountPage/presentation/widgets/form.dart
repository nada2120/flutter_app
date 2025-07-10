import 'package:flutter/material.dart';
import 'package:team_project/createAccountPage/presentation/widgets/text_register.dart';
import 'create_button.dart';

class MyFormAccount extends StatefulWidget {
  const MyFormAccount({super.key});

  @override
  State<MyFormAccount> createState() => _MyFormAccountState();
}

class _MyFormAccountState extends State<MyFormAccount> {
  bool isPasswordHidden = true;

  bool isConfirmHidden = true;

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirm = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: Column(
        children: [
          /// Username or Email
          TextFormField(
            controller: username,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "The field is required";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                labelText: 'Username or Email',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(height: 24),

          /// Password
          TextFormField(
            controller: password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "The field is required";
              } else {
                return null;
              }
            },
            obscureText: isPasswordHidden,
            decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                    icon: Icon(isPasswordHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined))),
          ),
          SizedBox(height: 24),

          /// Confirm Password
          TextFormField(
            controller: confirm,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "The field is required";
              }  else if(value != password.text) {
                return "Password do not match";
              } else {
                return null;
              }
            },
            obscureText: isConfirmHidden,
            decoration: InputDecoration(
                labelText: 'ConfirmPassword',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isConfirmHidden = !isConfirmHidden;
                      });
                    },
                    icon: Icon(isConfirmHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined))),
          ),
    SizedBox(height: 16),

    /// TextSpan
    TextRegister(),

    SizedBox(height: 32),

    /// ButtonCreateAccount
    CreateAccountButton(formKey: formKey)

        ],
      ),
    );
  }
}



