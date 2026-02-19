import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TaskSummaryRow extends StatelessWidget {
  final int todayCount;
  final int overdueCount;
  final int doneCount;

  const TaskSummaryRow({
    super.key,
    required this.todayCount,
    required this.overdueCount,
    required this.doneCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _SummaryCard(title: "Today", value: "$todayCount", icon: Icons.today_rounded)),
        const SizedBox(width: 10),
        Expanded(child: _SummaryCard(title: "Overdue", value: "$overdueCount", icon: Icons.warning_rounded)),
        const SizedBox(width: 10),
        Expanded(child: _SummaryCard(title: "Done", value: "$doneCount", icon: Icons.verified_rounded)),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, 10)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0x22D94141),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primaryRed, size: 18),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textSoft,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
