import 'package:event_planning_pojo/ui/screens/home/tabs/fav_tab/fav_tab.dart';
import 'package:event_planning_pojo/ui/screens/home/tabs/home_tab.dart/home_tab.dart';
import 'package:event_planning_pojo/ui/screens/home/tabs/map_tab/map_tab.dart';
import 'package:event_planning_pojo/ui/screens/home/tabs/profile_tab/profile_tab.dart';
import 'package:event_planning_pojo/ui/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const tag = 'HomeScreen';
  const HomeScreen({super.key ,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    

    return Scaffold(
      extendBody: true,
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
              'Youssef Taher',
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
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNav(
        callBack: (index){
        setState(() {
          currentIndex = index;
        });
      },
      ),
    );
  }
final List <Widget> tabs = 
[
  HomeTab(),
  MapTab(),
  FavTab(),
  ProfileTab(),
];
}
