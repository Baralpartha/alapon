import 'package:flutter/material.dart';
import 'list_card.dart';

class UpcomingMeetingCard extends StatelessWidget {
  const UpcomingMeetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListCard(
      title: "Team Meeting",
      subtitle: "11:00 AM • Substation Office",
      icon: Icons.groups_rounded,
    );
  }
}
