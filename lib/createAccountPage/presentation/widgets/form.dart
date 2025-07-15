import 'package:flutter/material.dart';
import 'package:team_project/createAccountPage/presentation/widgets/text_register.dart';
import 'create_button.dart';

class MyFormAccount extends StatefulWidget {
  final GlobalKey<FormState> formKey; // ✅ نمرر المفتاح من الخارج

  const MyFormAccount({super.key, required this.formKey});

  @override
  State<MyFormAccount> createState() => _MyFormAccountState();
}

class _MyFormAccountState extends State<MyFormAccount> {
  bool isPasswordHidden = true;
  bool isConfirmHidden = true;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey, // ✅ استخدام المفتاح الممرر من فوق
      child: Column(
        children: [
          /// Username or Email
          TextFormField(
            controller: username,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "The field is required";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Username or Email',
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 24),

          /// Password
          TextFormField(
            controller: password,
            obscureText: isPasswordHidden,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "The field is required";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
                icon: Icon(
                  isPasswordHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          /// Confirm Password
          TextFormField(
            controller: confirm,
            obscureText: isConfirmHidden,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "The field is required";
              } else if (value != password.text) {
                return "Password do not match";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: const Icon(Icons.lock),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isConfirmHidden = !isConfirmHidden;
                  });
                },
                icon: Icon(
                  isConfirmHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          /// Text Register
          const TextRegister(),
          const SizedBox(height: 32),

          /// Button
          CreateAccountButton(formKey: widget.formKey),
        ],
      ),
    );
  }
}