import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/themed_top_bar.dart';
import '../widgets/task_summary_row.dart';
import '../widgets/task_filter_chips.dart';
import '../widgets/task_card.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  int filterIndex = 0;

  final tasks = const <TaskUiModel>[
    TaskUiModel(
      title: "Safety Inspection",
      subtitle: "Substation A • Checklist verification",
      timeText: "2:00 PM",
      priority: TaskPriority.high,
      status: TaskStatus.inProgress,
    ),
    TaskUiModel(
      title: "Report Submission",
      subtitle: "Daily grid status report upload",
      timeText: "4:00 PM",
      priority: TaskPriority.medium,
      status: TaskStatus.pending,
    ),
    TaskUiModel(
      title: "Line Maintenance",
      subtitle: "Feeder-12 • Replace damaged insulator",
      timeText: "Overdue",
      priority: TaskPriority.high,
      status: TaskStatus.overdue,
    ),
    TaskUiModel(
      title: "Meeting Notes",
      subtitle: "Team meeting summary to HR",
      timeText: "Done",
      priority: TaskPriority.low,
      status: TaskStatus.done,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ThemedAppBar(
              title: "Tasks",
              showBack: false,
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
                    const TaskSummaryRow(
                      todayCount: 6,
                      overdueCount: 1,
                      doneCount: 12,
                    ),
                    const SizedBox(height: 12),

                    TaskFilterChips(
                      items: const ["All", "Today", "Overdue", "Done"],
                      selectedIndex: filterIndex,
                      onChanged: (i) => setState(() => filterIndex = i),
                    ),

                    const SizedBox(height: 12),

                    // list container (like your other screens)
                    Container(
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
                        itemCount: tasks.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, i) => TaskCard(
                          model: tasks[i],
                          onTap: () {},
                          onDoneTap: () {},
                        ),
                      ),
                    ),
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
