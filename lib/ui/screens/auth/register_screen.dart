import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/widgets/input_field.dart';
import 'package:event_planning_pojo/ui/widgets/password_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String tag = 'registerScreen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("register".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24),
            Column(
              children: [
                Image.asset(
                  'assets/images/loginLogo.png',
                ),
              ],
            ),
            SizedBox(height: 24),
            InputField(
              label: "name".tr(),
              icon: Icons.person,
            ),
            SizedBox(height: 24),
            InputField(
              label: "email".tr(),
              icon: Icons.person,
            ),
            SizedBox(height: 24),
            PasswordField(),
            SizedBox(height: 24),
            PasswordField(
              label: "re_Password",
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "create_account".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already_have_account".tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "login".tr(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).primaryColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
