import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, 10)),
        ],
      ),
      child: Column(
        children: const [
          _TaskTile(
            title: "Team Meeting",
            subtitle: "Okay, let's start the inspection now",
            time: "11:00 AM",
            icon: Icons.calendar_month_rounded,
          ),
          _Divider(),
          _TaskTile(
            title: "Safety Inspection",
            subtitle: "All set for the report",
            time: "2:00 PM",
            icon: Icons.verified_rounded,
          ),
          _Divider(),
          _TaskTile(
            title: "Report Submission",
            subtitle: "H6 to final",
            time: "4:00 PM",
            icon: Icons.description_rounded,
          ),
        ],
      ),
    );
  }
}

class _TaskTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;

  const _TaskTile({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0x22D94141),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFFD94141)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF7E2A2A))),
                const SizedBox(height: 3),
                Text(subtitle, style: const TextStyle(color: Color(0xFF8B5C5C))),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(time, style: const TextStyle(color: Color(0xFF8B5C5C), fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, thickness: 1, color: Color(0x11D94141));
  }
}
