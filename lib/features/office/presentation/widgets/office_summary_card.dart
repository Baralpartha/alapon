import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class OfficeSummaryCard extends StatelessWidget {
  const OfficeSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 18, offset: Offset(0, 10)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0x22D94141),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.apartment_rounded, color: AppColors.primaryRed, size: 26),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Power Development Board",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Operations Division • Substation HQ",
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textSoft,
                  ),
                ),
                SizedBox(height: 8),
                _MiniRow(icon: Icons.schedule_rounded, text: "9:00 AM - 5:00 PM"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _MiniRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primaryRed),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.textSoft,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
