import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

enum MeetingType { official, safety, field }

class MeetingUiModel {
  final String title;
  final String time;
  final String location;
  final MeetingType type;

  const MeetingUiModel(this.title, this.time, this.location, this.type);
}

class MeetingTile extends StatelessWidget {
  final MeetingUiModel model;
  final VoidCallback onTap;

  const MeetingTile({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final (pillText, pillBg, pillFg, icon) = _style(model.type);

    return InkWell(
      onTap: onTap,
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
              child: Icon(icon, color: AppColors.primaryRed, size: 22),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          model.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      Text(
                        model.time,
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w900,
                          color: AppColors.iconSoft,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: pillBg,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          pillText,
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: pillFg),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          model.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.textSoft,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),
            const Icon(Icons.chevron_right_rounded, color: AppColors.iconSoft),
          ],
        ),
      ),
    );
  }

  static (String, Color, Color, IconData) _style(MeetingType t) {
    switch (t) {
      case MeetingType.official:
        return ("Official", const Color(0x22D94141), AppColors.primaryRed, Icons.groups_rounded);
      case MeetingType.safety:
        return ("Safety", const Color(0x226BBF7B), const Color(0xFF2F7D3B), Icons.health_and_safety_rounded);
      case MeetingType.field:
        return ("Field", const Color(0x22F4A261), const Color(0xFFB85A10), Icons.engineering_rounded);
    }
  }
}
