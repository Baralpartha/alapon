import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;

  const SectionTitle({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Color(0xFF7E2A2A),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            actionText,
            style: const TextStyle(color: Color(0xFFD94141), fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
