import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/themed_top_bar.dart';
import '../widgets/contacts_search_bar.dart';
import '../widgets/contacts_filter_chips.dart';
import '../widgets/emergency_contacts_card.dart';
import '../widgets/contacts_list.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  int filterIndex = 0;
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ThemedAppBar(
              title: "Contacts",
              showBack: true,
              onBack: () => Navigator.maybePop(context),
              actions: [
                ThemedAppBarAction(icon: Icons.person_add_alt_1_rounded, onTap: () {}),
                ThemedAppBarAction(icon: Icons.more_horiz_rounded, onTap: () {}),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 18),
                child: Column(
                  children: [
                    ContactsSearchBar(
                      hint: "Search name, designation, department...",
                      onChanged: (v) => setState(() => query = v),
                    ),
                    const SizedBox(height: 10),

                    ContactsFilterChips(
                      items: const ["All", "My Team", "Office", "Emergency"],
                      selectedIndex: filterIndex,
                      onChanged: (i) => setState(() => filterIndex = i),
                    ),
                    const SizedBox(height: 12),

                    const EmergencyContactsCard(),
                    const SizedBox(height: 12),

                    ContactsList(
                      query: query,
                      filterIndex: filterIndex,
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
