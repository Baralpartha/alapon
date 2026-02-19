import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xFFD94141),
      unselectedItemColor: const Color(0xFFB48E8E),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people_alt_rounded), label: "Employees"),
        BottomNavigationBarItem(icon: Icon(Icons.task_alt_rounded), label: "Tasks"),
        BottomNavigationBarItem(icon: Icon(Icons.perm_contact_cal), label: "Profile"),
      ],
    );
  }
}
