import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class OfficeDepartments extends StatelessWidget {
  const OfficeDepartments({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      _Dept("Substation Operation", "Shift roster & live operations", Icons.electrical_services_rounded),
      _Dept("Line Maintenance", "Feeder & line work orders", Icons.construction_rounded),
      _Dept("Safety & Compliance", "Inspection checklist & training", Icons.health_and_safety_rounded),
      _Dept("Admin & HR", "Leave, policy, employee support", Icons.groups_rounded),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Departments",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 18,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: List.generate(items.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == items.length - 1 ? 0 : 10,
                ),
                child: _DeptTile(model: items[index]),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _Dept {
  final String title;
  final String subtitle;
  final IconData icon;
  const _Dept(this.title, this.subtitle, this.icon);
}

class _DeptTile extends StatelessWidget {
  final _Dept model;
  const _DeptTile({required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF6F6),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0x11D94141)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0x22D94141),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                model.icon,
                color: AppColors.primaryRed,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    model.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textSoft,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.iconSoft,
            ),
          ],
        ),
      ),
    );
  }
}
