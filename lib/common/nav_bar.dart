import 'package:chat_app/features/screens/chats.dart';
import 'package:chat_app/features/screens/updates.dart';
import 'package:chat_app/utils/colors.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  static const String routeName = '/main_screen';
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int currentPageIndex = 0;

  void qrCodeScanner() {}

  void openCamera() {}

  void menu() {}

  final List<Widget> _pages = [
    Chats(),
    UpdateScreen(),
    Center(
      child: Text("data2"),
    ),
    Center(
      child: Text("data3"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: <Widget>[
            NavigationDestination(
                selectedIcon: Icon(Icons.chat),
                icon: Icon(Icons.chat_bubble_outline),
                label: "chats"),
            NavigationDestination(
                selectedIcon: Icon(Icons.circle),
                icon: Icon(Icons.circle_outlined),
                label: "Updates"),
            NavigationDestination(
                selectedIcon: Icon(Icons.group),
                icon: Icon(Icons.group_outlined),
                label: "Communities"),
            NavigationDestination(
                selectedIcon: Icon(Icons.call),
                icon: Icon(Icons.call_outlined),
                label: "calls"),
          ],
        ),
        body: _pages[currentPageIndex],
      ),
    );
  }
}
