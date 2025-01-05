import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/providers/auth_validation_provider.dart';
import 'package:event_planning_pojo/ui/services/auth_service.dart';
import 'package:event_planning_pojo/ui/widgets/input_field.dart';
import 'package:event_planning_pojo/ui/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  static const String tag = 'registerScreen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthValidationProvider(authService: AuthService()),
      builder: (context, child) {
        var provider = Provider.of<AuthValidationProvider>(context);
       // provider.dispose();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            iconTheme:
            IconThemeData(color: Theme.of(context).secondaryHeaderColor),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text("register".tr() , style: Theme.of(context).textTheme.titleSmall,),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: provider.signUpKey,
              child: SingleChildScrollView(
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
                      controller: provider.nameController,
                      validator: provider.validateNameText,
                      label: "name".tr(),
                      icon: Icons.person,
                    ),
                    SizedBox(height: 24),
                    InputField(
                      controller: provider.emailController,
                      validator: provider.validateEmailText,
                      label: "email".tr(),
                      icon: Icons.person,
                    ),
                    SizedBox(height: 24),
                    PasswordField(
                      controller: provider.passwordController,
                      validator: provider.validatePasswordText,
                      label: "password",
                    ),
                    SizedBox(height: 24),
                    PasswordField(
                      controller: TextEditingController(),
                      validator: provider.validateRePasswordText,
                      label: "re_Password",
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        await provider.signUp(context);
                      },
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
