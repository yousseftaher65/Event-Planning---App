import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back ✨',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    /* fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.normal, */
                    fontSize: 14,
                    color: Color(0xffF2FEFF),
                  ),
            ),
            Text(
              'Balf',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    /* fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.normal, */
                    fontSize: 24,
                    color: Color(0xffF2FEFF),
                  ),
            ),
          ],
        ),
        bottom: AppBar(
          toolbarHeight: 100,
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/mapIcon.png',
                  ),
                  Text(
                    'Cairo, Egypt',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          /* fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.normal, */
                          fontSize: 14,
                          color: Color(0xffF2FEFF),
                        ),
                  ),
                ],
              ),
              Text(
                'Youssef Taher',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      /* fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.normal, */
                      fontSize: 14,
                      color: Color(0xffF2FEFF),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
