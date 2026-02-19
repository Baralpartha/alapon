import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_header_card.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_about_card.dart';
import '../widgets/profile_settings_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: const [
            ProfileAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(14, 12, 14, 18),
                child: Column(
                  children: [
                    ProfileHeaderCard(),
                    SizedBox(height: 12),
                    ProfileInfoCard(),
                    SizedBox(height: 12),
                    ProfileAboutCard(),
                    SizedBox(height: 12),
                    ProfileSettingsCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
