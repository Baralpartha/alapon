import 'package:flutter/material.dart';
import 'contact_tile.dart';

class ContactsList extends StatelessWidget {
  final String query;
  final int filterIndex;

  const ContactsList({
    super.key,
    required this.query,
    required this.filterIndex,
  });

  @override
  Widget build(BuildContext context) {
    const all = <ContactUiModel>[
      ContactUiModel("Sumon Biswas", "Assistant Engineer", "Substation Operation", "01711-111111", true),
      ContactUiModel("Ahmed Hossain", "Senior Technician", "Line Maintenance", "01722-222222", false),
      ContactUiModel("Maitri Roy", "Junior Engineer", "Safety & Compliance", "01733-333333", true),
      ContactUiModel("Ashikur Rahman", "Lineman", "Feeder-12", "01744-444444", false),
      ContactUiModel("Nusrat Jahan", "HR Executive", "Admin & HR", "01755-555555", true),
    ];

    final q = query.trim().toLowerCase();
    final filtered = all.where((e) {
      final matchQuery = q.isEmpty ||
          e.name.toLowerCase().contains(q) ||
          e.designation.toLowerCase().contains(q) ||
          e.department.toLowerCase().contains(q);

      // filterIndex: 0 all, 1 my team(online), 2 office(admin/hr), 3 emergency(show none - you can adapt)
      final matchFilter = switch (filterIndex) {
        0 => true,
        1 => e.online,
        2 => e.department.toLowerCase().contains("admin") || e.department.toLowerCase().contains("hr"),
        3 => false,
        _ => true,
      };

      return matchQuery && matchFilter;
    }).toList();

    return Container(
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
        itemCount: filtered.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) => ContactTile(
          model: filtered[i],
          onCall: () {},
          onMessage: () {},
        ),
      ),
    );
  }
}
