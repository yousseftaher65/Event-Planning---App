import 'package:event_planning_pojo/ui/screens/home/tabs/create_event_tab/create_event_tab.dart';
import 'package:event_planning_pojo/ui/screens/home/tabs/fav_tab/fav_tab.dart';
import 'package:event_planning_pojo/ui/screens/home/tabs/home_tab.dart/home_tab.dart';
import 'package:event_planning_pojo/ui/screens/home/tabs/map_tab/map_tab.dart';
import 'package:event_planning_pojo/ui/screens/home/tabs/profile_tab/profile_tab.dart';
import 'package:event_planning_pojo/ui/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const tag = 'HomeScreen';
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int currentIndex = 0;
String? _userName;
String? _userEmail;


class _HomeScreenState extends State<HomeScreen> {
  @override
 
  void dispose() {
    currentIndex = 0;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      _userName = arguments['name'];
      _userEmail = arguments['email'];
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateEventTab.tag);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      //extendBody: true,
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNav(
        callBack: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  final List<Widget> tabs = [
    HomeTab(userName: _userName),
    MapTab(),
    FavTab(),
    ProfileTab(userName: _userName, userEmail: _userEmail),
  ];
}
