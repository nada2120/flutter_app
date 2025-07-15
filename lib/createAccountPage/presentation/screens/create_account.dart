import 'package:flutter/material.dart';
import '../widgets/divider.dart';
import '../widgets/footer.dart';
import '../widgets/form.dart';
import '../widgets/social_media_buttons.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .apply(fontWeightDelta: 2),
              ),
              const SizedBox(height: 32),

              MyFormAccount(formKey: formKey),

              const SizedBox(height: 32),

              /// Divider
              const MyDividerAccount(),

              const SizedBox(height: 32),

              /// SocialMedia
              const SocialMediaButtons(),

              const SizedBox(height: 32),

              /// Footer
              const MyFooterAccount(),
            ],
          ),
        ),
      ),
    );
  }
}