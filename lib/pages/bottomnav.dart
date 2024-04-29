import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecomurse/pages/profile.dart';
import 'package:ecomurse/pages/wallet.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'order.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentTabIndex = 0;
  late List<Widget> pages;
  late Home homepage;
  late Profile profile;
  late Order order;
  late Wallet wallet;

  @override
  void initState() {
    homepage = Home();
    order = Order();
    profile = Profile();
    wallet = Wallet();
    pages = [homepage, order, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.shopping_bag, color: Colors.white),
          Icon(Icons.wallet, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
      body: pages[_currentTabIndex],
    );
  }
}
