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
             // SizedBox(height: 64,),
              Text(
                'Create an account',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .apply(fontWeightDelta: 2),
              ),
              SizedBox(height: 32),
             ///Form
              MyFormAccount(),
                    SizedBox(height: 32,),
                   ///Divider
                 MyDividerAccount(),
                    SizedBox(height: 32,),
                   ///SocialMedia
                 SocialMediaButtons(),
                    SizedBox(height: 32,),
                    ///Footer
              MyFooterAccount()
            ],
          ),
        ),
      ),
    );
  }
}



