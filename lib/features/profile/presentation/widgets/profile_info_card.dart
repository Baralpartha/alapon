import 'package:flutter/material.dart';
import 'profile_atoms.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CardShell(
      child: Column(
        children: const [
          RowItem(icon: Icons.edit_calendar_rounded, title: "Edit Profile", trailing: true),
          DividerSoft(),
          RowItem(icon: Icons.email_outlined, title: "Partha.00cse@gmail.com", trailing: true),
          DividerSoft(),
          RowItem(icon: Icons.phone_rounded, title: "+88013-19829086", trailing: true),
        ],
      ),
    );
  }
}
