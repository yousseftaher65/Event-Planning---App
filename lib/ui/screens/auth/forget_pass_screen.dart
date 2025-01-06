import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/providers/auth_validation_provider.dart';
import 'package:event_planning_pojo/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassScreen extends StatelessWidget {
  static const String tag = 'forgetPassScreen';
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => AuthValidationProvider(),
      builder: (context, child) {
        var provider = Provider.of<AuthValidationProvider>(context);
        return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "forgot_password".tr(),style: Theme.of(context).textTheme.titleSmall,),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/forgBg.png',
              width: double.infinity,
              fit: BoxFit.fill,),
              SizedBox(height: 24,),
              InputField(
                controller: provider.emailController,
                validator: provider.validateEmailText,
                label: "email".tr(), icon: Icons.email_rounded,),
              SizedBox(height: 24,),
              ElevatedButton(onPressed: (){}, child: Text(
                    "reset_password".tr() ,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),))
            ],
          ),
        ),
      );
      }
    );
  }
}