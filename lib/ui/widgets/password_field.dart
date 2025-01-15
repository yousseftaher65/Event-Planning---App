import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/providers/show_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const PasswordField(
      {super.key,
      this.label = "password",
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShowPasswordProvider(),
      child: Consumer<ShowPasswordProvider>(
        builder: (context, provider, child) => TextFormField(
          obscureText: provider.isScure,
          cursorColor: Theme.of(context).indicatorColor,
          style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_rounded),
            labelText: label.tr(),
            suffixIcon: IconButton(
              onPressed: () {
                provider.toggleShowPassword();
              },
              icon: Icon(
                  provider.isScure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color:
                      Theme.of(context).inputDecorationTheme.prefixIconColor),
            ),
          ),
        ),
      ),
    );
  }
}
