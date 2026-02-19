import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class MeetingCalendarStrip extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const MeetingCalendarStrip({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final days = _next7Days();

    return SizedBox(
      height: 78,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final selected = i == selectedIndex;
          final d = days[i];

          return InkWell(
            onTap: () => onChanged(i),
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 62,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: selected ? AppColors.primaryRed : Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, 10)),
                ],
                border: Border.all(color: const Color(0x11D94141)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    d.weekday,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: selected ? Colors.white : AppColors.textSoft,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    d.day,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: selected ? Colors.white : AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DayChip {
  final String weekday;
  final String day;
  const _DayChip(this.weekday, this.day);
}

List<_DayChip> _next7Days() {
  final now = DateTime.now();
  final names = const ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  return List.generate(7, (i) {
    final d = now.add(Duration(days: i));
    return _DayChip(names[d.weekday % 7], "${d.day}");
  });
}
