import 'package:flutter/material.dart';
import '../../../../core/routes/app_routes.dart';
import '../widgets/top_header.dart';
import '../widgets/hero_card.dart';
import '../widgets/quick_actions_grid.dart';
import '../widgets/section_title.dart';
import '../widgets/task_list.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
      children: [
        const TopHeader(name: "Partha Sarathi Baral", notificationCount: 3),
        const SizedBox(height: 12),

        const HeroCard(),
        const SizedBox(height: 14),

        QuickActionsGrid(
          onItemTap: (item) {
            if (item.title == "Login") {
              Navigator.pushNamed(context, AppRoutes.login);
            }
            if (item.title == "Meeting") {
              Navigator.pushNamed(context, AppRoutes.meetings);
            }
            if (item.title == "Office") {
              Navigator.pushNamed(context, AppRoutes.office);
            }
            if (item.title == "Messages") {
              Navigator.pushNamed(context, AppRoutes.Messages);
            }
            if (item.title == "Notice") {
              Navigator.pushNamed(context, AppRoutes.notice);
            }
            if (item.title == "Contacts") {
              Navigator.pushNamed(context, AppRoutes.contacts);
            }




          },
        ),

        const SizedBox(height: 18),
        SectionTitle(title: "Today’s Tasks", actionText: "View All", onTap: () {}),
        const SizedBox(height: 10),
        const TaskList(),
      ],
    );
  }
}
