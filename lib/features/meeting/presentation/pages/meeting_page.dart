import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/themed_top_bar.dart';
import '../widgets/meeting_calendar_strip.dart';
import '../widgets/meeting_hero_card.dart';
import '../widgets/meeting_list.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  int selectedDayIndex = 2; // today

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ThemedAppBar(
              title: "Meetings",
              showBack: true,
              onBack: () => Navigator.maybePop(context),
              actions: [
                ThemedAppBarAction(icon: Icons.search_rounded, onTap: () {}),
                ThemedAppBarAction(icon: Icons.tune_rounded, onTap: () {}),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MeetingCalendarStrip(
                      selectedIndex: selectedDayIndex,
                      onChanged: (i) => setState(() => selectedDayIndex = i),
                    ),
                    const SizedBox(height: 12),

                    const MeetingHeroCard(
                      title: "Operations Sync",
                      timeText: "11:00 AM • Substation Office",
                      note: "Agenda: safety, feeder maintenance, daily report.",
                    ),
                    const SizedBox(height: 14),

                    const Text(
                      "Today’s Schedule",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const MeetingList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryRed,
        onPressed: () {},
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
    );
  }
}
