import 'package:flutter/material.dart';
import 'meeting_tile.dart';

class MeetingList extends StatelessWidget {
  const MeetingList({super.key});

  @override
  Widget build(BuildContext context) {
    const data = <MeetingUiModel>[
      MeetingUiModel("Team Meeting", "11:00 AM", "Substation Office", MeetingType.official),
      MeetingUiModel("Safety Briefing", "02:00 PM", "Control Room", MeetingType.safety),
      MeetingUiModel("Site Visit Plan", "04:30 PM", "Feeder-12", MeetingType.field),
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
        itemBuilder: (context, i) => MeetingTile(model: data[i], onTap: () {}),
      ),
    );
  }
}
