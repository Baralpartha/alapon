import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/themed_top_bar.dart';
import '../widgets/notice_filter_chips.dart';
import '../widgets/notice_featured_card.dart';
import '../widgets/notice_list.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  int filterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ThemedAppBar(
              title: "Notices",
              showBack: true,
              onBack: () => Navigator.maybePop(context),
              actions: [
                ThemedAppBarAction(icon: Icons.search_rounded, onTap: () {}),
                ThemedAppBarAction(icon: Icons.notifications_none_rounded, onTap: () {}),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NoticeFilterChips(
                      items: const ["All", "Urgent", "HR", "Maintenance", "Training"],
                      selectedIndex: filterIndex,
                      onChanged: (i) => setState(() => filterIndex = i),
                    ),
                    const SizedBox(height: 12),

                    const NoticeFeaturedCard(
                      tag: "URGENT",
                      title: "Grid Line Maintenance Window",
                      subtitle: "Feeder-12 work scheduled today 3:00 PM – 5:00 PM.",
                      meta: "Ops Division • Updated 15 min ago",
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      "Latest Updates",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const NoticeList(),
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
