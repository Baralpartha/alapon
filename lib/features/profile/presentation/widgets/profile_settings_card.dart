import 'package:flutter/material.dart';
import 'profile_atoms.dart';

class ProfileSettingsCard extends StatelessWidget {
  const ProfileSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CardShell(
      child: Column(
        children: const [
          SectionHeader(title: "Social Links"),
          SizedBox(height: 6),
          RowItem(icon: Icons.notifications_none_rounded, title: "Notification", trailing: true),
          DividerSoft(),
          RowItem(icon: Icons.lock_outline_rounded, title: "Privacy & Security", trailing: true),
          DividerSoft(),
          RowItem(icon: Icons.article_outlined, title: "Terms & Polocites", trailing: true),
          DividerSoft(),
          RowItem(icon: Icons.logout_rounded, title: "Logout", trailing: false),
        ],
      ),
    );
  }
}
