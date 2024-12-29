import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/screens/home/home_screen.dart';
import 'package:event_planning_pojo/ui/screens/auth/forget_pass_screen.dart';
import 'package:event_planning_pojo/ui/screens/auth/register_screen.dart';
import 'package:event_planning_pojo/ui/widgets/input_field.dart';
import 'package:event_planning_pojo/ui/widgets/password_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String tag = 'loginScreen';
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/loginLogo.png',
                  ),
                ],
              ),
              SizedBox(height: 28),
              InputField(
                label: "email".tr(),
                icon: Icons.email_rounded,
              ),
              SizedBox(height: 16),
              PasswordField(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ForgetPassScreen.tag);
                    },
                    child: Text(
                      "forgot_password".tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).primaryColor,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.tag);
                },
                child: Text(
                  "login".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 24),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.tag);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: "dont_have_account".tr(),
                    children: [
                      TextSpan(
                        text: "create_account".tr(),
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).primaryColor,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 24,
                      indent: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "or".tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      endIndent: 16,
                      indent: 24,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
            ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logos/googleLogo.png'),
                    SizedBox(width: 8),
                    Text(
                       "login_with_google".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
