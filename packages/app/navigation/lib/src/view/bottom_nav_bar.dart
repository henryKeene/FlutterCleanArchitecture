import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation/src/router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.child,
    required this.currentIndex,
    super.key,
  });

  final Widget child;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        //Setting a custom overlay style for the app
        //This will make android status bar look better.
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          extendBody: true,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            enableFeedback: true,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) => switch (index) {
              0 => router.go('/home'),
              1 => router.go('/team'),
              2 => router.go('/contact'),
              _ => router.go('/'),
            },
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                activeIcon: Icon(Icons.people),
                label: 'Team',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail_outlined),
                activeIcon: Icon(Icons.contact_mail),
                label: 'Contact Us',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
