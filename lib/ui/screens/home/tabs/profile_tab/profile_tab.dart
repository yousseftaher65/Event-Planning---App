import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/providers/auth_validation_provider.dart';
import 'package:event_planning_pojo/ui/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  final String? userName;
  final String? userEmail;
  const ProfileTab({super.key , required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => AuthValidationProvider(),
      builder: (context, child) {
        var authProvider = Provider.of<AuthValidationProvider>(context);
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
                    userName ?? 'User',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 24, color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    userEmail ?? 'User',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context)
                            .bottomNavigationBarTheme
                            .selectedItemColor),
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
                "language".tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20,
                      color: Theme.of(context).indicatorColor,
                    ),
              ),
              SizedBox(height: 16),
              DropdownMenu(
               controller: TextEditingController(
                    text: context.locale.languageCode == 'en'
                        ? "english".tr()
                        : "arabic".tr()),
                width: double.infinity,
                trailingIcon: Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
                selectedTrailingIcon: Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
                enableSearch: false,
                onSelected: (value) {
                  if (value == 'ar') {
                    context.setLocale(
                      Locale('ar'),
                    );
                  } else {
                    context.setLocale(
                      Locale('en'),
                    );
                  }
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                    label: "english".tr(),
                    value:'en',
                  ),
                  DropdownMenuEntry(
                    label: "arabic".tr(),
                    value: 'ar',
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "theme".tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20,
                      color: Theme.of(context).indicatorColor,
                    ),
              ),
              SizedBox(height: 16),
              DropdownMenu(
                controller: TextEditingController(text: provider.themeMode == ThemeMode.light ? "light".tr() : "dark".tr()),
                width: double.infinity,
                trailingIcon: Icon(Icons.arrow_drop_down_rounded , color: Theme.of(context).primaryColor, size: 50,),
                selectedTrailingIcon: Icon(Icons.arrow_drop_down_rounded , color: Theme.of(context).primaryColor, size: 50,
                ),
                enableSearch: false,
                onSelected: (ThemeMode? value) {
                  if (value != null) {
                    provider.changeTheme(value);
                  }
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                    label: "light".tr(),
                    value: ThemeMode.light,
                  ),
                  DropdownMenuEntry(
                    label: "dark".tr(),
                    value: ThemeMode.dark,
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  authProvider.signOut(context);
                 // AuthService().signOut(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFF5659),
                ),
                child: Row(
                  children: [
                    Text(
                      "logout".tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20,
                            color: Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor,
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.logout_rounded,
                      color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedItemColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}
