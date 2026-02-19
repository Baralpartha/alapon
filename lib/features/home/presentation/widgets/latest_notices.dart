import 'package:flutter/material.dart';
import 'list_card.dart';

class LatestNotices extends StatelessWidget {
  const LatestNotices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListCard(
          title: "Maintenance Alert",
          subtitle: "Grid line work at 3 PM",
          icon: Icons.warning_rounded,
        ),
        SizedBox(height: 10),
        ListCard(
          title: "Holiday Notice",
          subtitle: "Office schedule updated",
          icon: Icons.campaign_rounded,
        ),
      ],
    );
  }
}
