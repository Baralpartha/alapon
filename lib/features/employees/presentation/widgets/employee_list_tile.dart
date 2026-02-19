import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

enum AvatarType { worker, person, placeholder }

class EmployeeUiModel {
  final String name;
  final String role;
  final String dept;
  final String tag;
  final int minutesAgo;
  final AvatarType avatarType;

  const EmployeeUiModel({
    required this.name,
    required this.role,
    required this.dept,
    required this.tag,
    required this.minutesAgo,
    required this.avatarType,
  });
}

class EmployeeListTile extends StatelessWidget {
  final EmployeeUiModel model;
  final VoidCallback onTap;

  const EmployeeListTile({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
            _Avatar(type: model.avatarType),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          model.name,
                          style: const TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w900,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      Text(
                        _timeText(model.minutesAgo),
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w800,
                          color: AppColors.iconSoft,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _RolePill(text: model.tag),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          model.role,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.2,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryRed,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    model.dept,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSoft,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _timeText(int minutesAgo) {
    if (minutesAgo < 60) return "${minutesAgo}m.ago";
    final h = (minutesAgo / 60).floor();
    return "${h}h.ago";
  }
}

class _RolePill extends StatelessWidget {
  final String text;
  const _RolePill({required this.text});

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

class _Avatar extends StatelessWidget {
  final AvatarType type;
  const _Avatar({required this.type});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (type) {
      case AvatarType.worker:
        icon = Icons.engineering_rounded;
        break;
      case AvatarType.person:
        icon = Icons.person_rounded;
        break;
      case AvatarType.placeholder:
        icon = Icons.apartment_rounded;
        break;
    }

    return CircleAvatar(
      radius: 22,
      backgroundColor: const Color(0x22D94141),
      child: Icon(icon, color: AppColors.primaryRed, size: 22),
    );
  }
}
