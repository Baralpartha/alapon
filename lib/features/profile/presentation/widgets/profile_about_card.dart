import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'profile_atoms.dart';

class ProfileAboutCard extends StatelessWidget {
  const ProfileAboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionHeader(title: "About me"),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.push_pin_rounded, color: AppColors.primaryRed, size: 18),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "10 years experience in Power Grid,\nSpecialized in Trans/e.metts & Sustatrens.",
                  style: TextStyle(
                    color: AppColors.textSoft,
                    fontWeight: FontWeight.w700,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
