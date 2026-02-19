import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

enum TaskPriority { high, medium, low }
enum TaskStatus { pending, inProgress, overdue, done }

class TaskUiModel {
  final String title;
  final String subtitle;
  final String timeText;
  final TaskPriority priority;
  final TaskStatus status;

  const TaskUiModel({
    required this.title,
    required this.subtitle,
    required this.timeText,
    required this.priority,
    required this.status,
  });
}

class TaskCard extends StatelessWidget {
  final TaskUiModel model;
  final VoidCallback onTap;
  final VoidCallback onDoneTap;

  const TaskCard({
    super.key,
    required this.model,
    required this.onTap,
    required this.onDoneTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(model.status);

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
              child: Icon(_statusIcon(model.status), color: AppColors.primaryRed, size: 22),
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
                        model.timeText,
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w900,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      _PriorityPill(priority: model.priority),
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

            if (model.status != TaskStatus.done)
              InkWell(
                onTap: onDoneTap,
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: const Color(0x22D94141)),
                  ),
                  child: const Icon(Icons.check_rounded, color: AppColors.primaryRed, size: 18),
                ),
              )
            else
              const Icon(Icons.verified_rounded, color: Color(0xFF6BBF7B), size: 20),
          ],
        ),
      ),
    );
  }

  static IconData _statusIcon(TaskStatus s) {
    switch (s) {
      case TaskStatus.pending:
        return Icons.pending_actions_rounded;
      case TaskStatus.inProgress:
        return Icons.timelapse_rounded;
      case TaskStatus.overdue:
        return Icons.warning_rounded;
      case TaskStatus.done:
        return Icons.verified_rounded;
    }
  }

  static Color _statusColor(TaskStatus s) {
    switch (s) {
      case TaskStatus.overdue:
        return AppColors.primaryRed;
      case TaskStatus.done:
        return const Color(0xFF2F7D3B);
      default:
        return AppColors.iconSoft;
    }
  }
}

class _PriorityPill extends StatelessWidget {
  final TaskPriority priority;
  const _PriorityPill({required this.priority});

  @override
  Widget build(BuildContext context) {
    final (text, bg, fg) = _style(priority);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: fg),
      ),
    );
  }

  static (String, Color, Color) _style(TaskPriority p) {
    switch (p) {
      case TaskPriority.high:
        return ("High", const Color(0x22D94141), AppColors.primaryRed);
      case TaskPriority.medium:
        return ("Med", const Color(0x22F4A261), const Color(0xFFB85A10));
      case TaskPriority.low:
        return ("Low", const Color(0x226BBF7B), const Color(0xFF2F7D3B));
    }
  }
}
