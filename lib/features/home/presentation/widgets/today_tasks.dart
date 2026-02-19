import 'package:flutter/material.dart';
import 'list_card.dart';

class TodayTasks extends StatelessWidget {
  const TodayTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListCard(
          title: "Safety Inspection",
          subtitle: "Due 2:00 PM",
          icon: Icons.verified_rounded,
        ),
        SizedBox(height: 10),
        ListCard(
          title: "Report Submission",
          subtitle: "Due 4:00 PM",
          icon: Icons.description_rounded,
        ),
      ],
    );
  }
}
