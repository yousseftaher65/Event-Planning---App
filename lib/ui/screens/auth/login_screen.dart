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
                label: 'Email',
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
                      'Forgot Password?',
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
                  'Login',
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
                    text: 'Don\'t have an account? ',
                    children: [
                      TextSpan(
                        text: 'create Account',
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
                      'OR',
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
                      'Login with Google',
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
