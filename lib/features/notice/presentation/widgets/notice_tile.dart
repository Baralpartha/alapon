import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

enum NoticeType { urgent, hr, maintenance, training, general }

class NoticeUiModel {
  final NoticeType type;
  final String title;
  final String subtitle;
  final String time;

  const NoticeUiModel({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.time,
  });
}

class NoticeTile extends StatelessWidget {
  final NoticeUiModel model;
  final VoidCallback onTap;

  const NoticeTile({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icon = _icon(model.type);
    final pill = _pill(model.type);

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      _TypePill(text: pill),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          model.subtitle,
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

  static IconData _icon(NoticeType t) {
    switch (t) {
      case NoticeType.urgent:
        return Icons.warning_rounded;
      case NoticeType.hr:
        return Icons.groups_rounded;
      case NoticeType.maintenance:
        return Icons.construction_rounded;
      case NoticeType.training:
        return Icons.school_rounded;
      case NoticeType.general:
        return Icons.article_rounded;
    }
  }

  static String _pill(NoticeType t) {
    switch (t) {
      case NoticeType.urgent:
        return "Urgent";
      case NoticeType.hr:
        return "HR";
      case NoticeType.maintenance:
        return "Maintenance";
      case NoticeType.training:
        return "Training";
      case NoticeType.general:
        return "General";
    }
  }
}

class _TypePill extends StatelessWidget {
  final String text;
  const _TypePill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0x22D94141),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w900,
          color: AppColors.primaryRed,
        ),
      ),
    );
  }
}
