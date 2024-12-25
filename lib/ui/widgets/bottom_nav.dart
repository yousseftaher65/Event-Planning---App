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
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem('map', 1, context),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem('fav', 2, context),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem('profile', 3, context),
          label: 'Profile',
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