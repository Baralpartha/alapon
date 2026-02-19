import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/themed_top_bar.dart';
import '../widgets/office_summary_card.dart';
import '../widgets/office_quick_actions.dart';
import '../widgets/office_departments.dart';
import '../widgets/office_notice_card.dart';
import '../widgets/office_primary_button.dart';

class OfficePage extends StatelessWidget {
  const OfficePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ThemedAppBar(
              title: "Office",
              showBack: true,
              onBack: () => Navigator.maybePop(context),
              actions: [
                ThemedAppBarAction(icon: Icons.search_rounded, onTap: () {}),
                ThemedAppBarAction(icon: Icons.more_horiz_rounded, onTap: () {}),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 18),
                child: Column(
                  children: const [
                    OfficeSummaryCard(),
                    SizedBox(height: 12),
                    OfficeQuickActions(),
                    SizedBox(height: 12),
                    OfficeDepartments(),
                    SizedBox(height: 12),
                    OfficeNoticeCard(),
                    SizedBox(height: 14),
                    OfficePrimaryButton(),
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
