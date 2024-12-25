import 'package:event_planning_pojo/ui/widgets/input_field.dart';
import 'package:event_planning_pojo/ui/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  static const String tag = 'registerScreen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register' , style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400),),
        iconTheme: IconThemeData(color: Colors.black),
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
              label: 'Name',
              icon: Icons.person,
            ),
            SizedBox(height: 24),
            InputField(
              label: 'Email',
              icon: Icons.person,
            ),
            SizedBox(height: 24),
            PasswordField(),
            SizedBox(height: 24),
            PasswordField( label: "Re Password",),
            SizedBox(height: 24),
            ElevatedButton(onPressed: (){}, child: Text('Create Account' ,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?', style: Theme.of(context).textTheme.bodyLarge,),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Login', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).primaryColor
                ),))
              ],
            )
          ],
        ),
      ),
    );
  }
}