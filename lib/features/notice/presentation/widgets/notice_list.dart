import 'package:flutter/material.dart';
import 'notice_tile.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({super.key});

  @override
  Widget build(BuildContext context) {
    const data = [
      NoticeUiModel(
        type: NoticeType.maintenance,
        title: "Transformer Oil Test Schedule",
        subtitle: "Monthly oil testing starts tomorrow. Submit sample list by 2 PM.",
        time: "1h ago",
      ),
      NoticeUiModel(
        type: NoticeType.hr,
        title: "Leave Approval Policy Update",
        subtitle: "New leave approval flow effective from next week.",
        time: "3h ago",
      ),
      NoticeUiModel(
        type: NoticeType.training,
        title: "Safety Training Session",
        subtitle: "PPE & lockout-tagout training • Friday 10:00 AM.",
        time: "Yesterday",
      ),
      NoticeUiModel(
        type: NoticeType.general,
        title: "Office Holiday Circular",
        subtitle: "Updated holiday calendar has been published.",
        time: "2 days ago",
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 18, offset: Offset(0, 10)),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) => NoticeTile(model: data[i], onTap: () {}),
      ),
    );
  }
}
