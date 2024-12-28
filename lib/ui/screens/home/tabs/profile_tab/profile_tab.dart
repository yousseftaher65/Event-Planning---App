import 'package:event_planning_pojo/ui/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

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
              child: Image.asset(
                'assets/images/model1.jpg',
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
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
                      .copyWith(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'Elbalf@gmail.com',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Language',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20,
                    color: Theme.of(context).indicatorColor,
                  ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    'English',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Theme',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20,
                    color: Theme.of(context).indicatorColor,
                  ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    'Light',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  DropdownButton(
                    items: [
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Light'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark'),
                    )
                  ], onChanged: (ThemeMode? value){
                    if(value != null){
                      provider.changeTheme(value);
                    }
                  },),
                  Spacer(),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFF5659),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    'Log Out',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
