import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/chat_search_bar.dart';
import '../widgets/chat_filter_chips.dart';
import '../widgets/employee_card.dart';
import 'chat_thread_page.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  int selectedChip = 0;

  final employees = const <EmployeeUiModel>[
    EmployeeUiModel(
      name: "Partha Sarathi Baral",
      subtitle: "Software Engineer",
      tag: "IT Bangla LTd.",
      isOnline: true,
      minutesAgo: null,
    ),
    EmployeeUiModel(
      name: "Sameer Islam",
      subtitle: "Senior Lineman",
      tag: "Orsda",
      isOnline: true,
      minutesAgo: null,
    ),
    EmployeeUiModel(
      name: "Ahmed Hossain",
      subtitle: "Substation Operation",
      tag: "Oklat",
      isOnline: true,
      minutesAgo: null,
    ),
    EmployeeUiModel(
      name: "Maitri Roy",
      subtitle: "Junior Engineer",
      tag: "Opsci",
      isOnline: true,
      minutesAgo: null,
    ),
    EmployeeUiModel(
      name: "Ashikur Rahman",
      subtitle: "Lineman",
      tag: "Lnm",
      isOnline: true,
      minutesAgo: 12,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F6),
      body: SafeArea(
        child: Column(
          children: [
            ChatAppBar(
              title: "ChatList",
              onBack: () => Navigator.maybePop(context),
              onAdd: () {},
              onSearch: () {},
              onLock: () {},
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChatSearchBar(
                    hint: "Search lineman...",
                    onChanged: (v) {},
                    onFilterTap: () {},
                  ),
                  const SizedBox(height: 10),

                  ChatFilterChips(
                    items: const ["All Employees", "Lineman", "Enginsens"],
                    selectedIndex: selectedChip,
                    onChanged: (i) => setState(() => selectedChip = i),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "Top 1 Bushehoves.",
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF8B5C5C),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 18),
                itemCount: employees.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, i) {
                  return EmployeeCard(
                    model: employees[i],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.chatThread,
                        arguments: ChatThreadArgs(
                          name: employees[i].name,
                          subtitle: employees[i].subtitle,
                          tag: employees[i].tag,
                          isOnline: employees[i].isOnline,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
