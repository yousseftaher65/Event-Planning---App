import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
               
            ),
          ),
          toolbarHeight: 180,
          backgroundColor: Theme.of(context).primaryColor,
          title: Row(
            children: [
               ClipOval(
          // borderRadius: BorderRadius.circular(40),
          child: Image.asset('assets/images/model1.jpg',
          width: 140,
          height: 140,
          fit: BoxFit.cover,),
        ),
        SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'El-Balf',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                          fontSize: 24,
                          color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Elbalf@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                          fontFamily:GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
