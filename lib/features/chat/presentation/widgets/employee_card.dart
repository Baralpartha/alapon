import 'package:flutter/material.dart';

class EmployeeUiModel {
  final String name;
  final String subtitle;
  final String tag;
  final bool isOnline;
  final int? minutesAgo;

  const EmployeeUiModel({
    required this.name,
    required this.subtitle,
    required this.tag,
    required this.isOnline,
    required this.minutesAgo,
  });
}

class EmployeeCard extends StatelessWidget {
  final EmployeeUiModel model;
  final VoidCallback onTap;

  const EmployeeCard({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, 10)),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0x22D94141),
              child: Icon(
                Icons.person_rounded,
                color: const Color(0xFFD94141),
                size: 26,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF7E2A2A),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    model.subtitle,
                    style: const TextStyle(
                      fontSize: 12.2,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF8B5C5C),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            _TagPill(text: model.tag),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  model.isOnline ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                  color: model.isOnline ? const Color(0xFF6BBF7B) : const Color(0xFFB48E8E),
                  size: 18,
                ),
                if (model.minutesAgo != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    "${model.minutesAgo}m ago",
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFB48E8E),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  final String text;
  const _TagPill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF6EE),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0x1A6BBF7B)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w900,
          color: Color(0xFF2F7D3B),
        ),
      ),
    );
  }
}
