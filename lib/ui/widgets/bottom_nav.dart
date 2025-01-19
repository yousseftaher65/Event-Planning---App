import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final Function callBack;
  const BottomNav({super.key , required this.callBack});

  @override
  State<BottomNav> createState() => _BottomNavState();
}
int currentIndex = 0;

class _BottomNavState extends State<BottomNav> {
  @override
  void dispose() {
    currentIndex = 0;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
              currentIndex = value;
              widget.callBack(currentIndex);
              
          });
        },
        items: [
        BottomNavigationBarItem(
          icon: _buildNavItem('home', 0, context),
          label: "home".tr(),
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem('map', 1, context),
          label: "map".tr(),
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem('fav', 2, context),
          label: "favorite".tr(),
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem('profile', 3, context),
          label: "profile".tr(),
        ),
      ]);
  }

  Widget _buildNavItem(String imageName, int index , BuildContext context) {
    return currentIndex == index
        ? ImageIcon(
          
          AssetImage('assets/icons/${imageName}Icon2.png'),
        )
        : ImageIcon(
          
            AssetImage('assets/icons/${imageName}Icon.png',),
          );
  }
}