import 'package:event_planning_pojo/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassScreen extends StatelessWidget {
  static const String tag = 'forgetPassScreen';
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Forget Password', style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400),),
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
            InputField(label: 'Email', icon: Icons.email_rounded,),
            SizedBox(height: 24,),
            ElevatedButton(onPressed: (){}, child: Text('Reset Password' ,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}