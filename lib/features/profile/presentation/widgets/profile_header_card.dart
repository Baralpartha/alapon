import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'profile_atoms.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CardShell(
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundColor: Color(0x22D94141),
            child: Icon(Icons.person_rounded, color: AppColors.primaryRed, size: 30),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Partha Sarathi Baral",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppColors.textDark),
                ),
                SizedBox(height: 2),
                Text(
                  "IT Bnagla Ltd.",
                  style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: AppColors.textSoft),
                ),
                SizedBox(height: 8),
                RedPill(text: "Software Engineer"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
