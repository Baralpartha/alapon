import 'package:flutter/material.dart';

import '../../../employees/presentation/pages/employees_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../tasks/presentation/pages/tasks_page.dart';
import '../widgets/bottom_nav.dart';
import '../../../chat/presentation/pages/chat_list_page.dart';
import '../widgets/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  late final List<Widget> pages = const [
    HomeTab(),
    ChatListPage(),
    EmployeesPage(),
    TasksPage(),      // ✅ replace placeholder
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F6),

      // ✅ IndexedStack keeps state of all tabs (pro behavior)
      body: SafeArea(
        child: IndexedStack(
          index: index,
          children: pages,
        ),
      ),

      bottomNavigationBar: HomeBottomNav(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  final String title;
  const _PlaceholderTab({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: Color(0xFF7E2A2A),
        ),
      ),
    );
  }
}
