import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/themed_top_bar.dart';
import '../widgets/employee_filter_chips.dart';
import '../widgets/employee_list_tile.dart';
import '../widgets/sync_button.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  int filterIndex = 0;

  final items = const <EmployeeUiModel>[
    EmployeeUiModel(
      name: "Sumon Biswas",
      role: "Assistant Engineer",
      dept: "Asenrah Dianas",
      tag: "Oklst",
      minutesAgo: 5,
      avatarType: AvatarType.worker,
    ),
    EmployeeUiModel(
      name: "Ahmed Hossain",
      role: "Senior Technician",
      dept: "Substation Operation",
      tag: "Oklst",
      minutesAgo: 41,
      avatarType: AvatarType.person,
    ),
    EmployeeUiModel(
      name: "Maitri Roy",
      role: "Junior Engineer",
      dept: "Grid Maintenance",
      tag: "Oklst",
      minutesAgo: 1,
      avatarType: AvatarType.person,
    ),
    EmployeeUiModel(
      name: "Ashikur Rahman",
      role: "Lineman",
      dept: "Line Maintenance",
      tag: "Lnm",
      minutesAgo: 120,
      avatarType: AvatarType.worker,
    ),
    EmployeeUiModel(
      name: "New Substation",
      role: "Notice",
      dept: "Team update",
      tag: "Info",
      minutesAgo: 240,
      avatarType: AvatarType.placeholder,
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
              title: "My Colleagues",
              onBack: () => Navigator.maybePop(context),
              actions: [
                ThemedAppBarAction(icon: Icons.search_rounded, onTap: () {}),
                ThemedAppBarAction(icon: Icons.person_rounded, onTap: () {}),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 18),
                child: Column(
                  children: [
                    EmployeeFilterChips(
                      selectedIndex: filterIndex,
                      items: const ["All", "Employees", "Notifications"],
                      onChanged: (i) => setState(() => filterIndex = i),
                    ),
                    const SizedBox(height: 12),

                    // List container like screenshot
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
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, i) => EmployeeListTile(
                          model: items[i],
                          onTap: () {},
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    SyncButton(
                      onTap: () {},
                    ),
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
