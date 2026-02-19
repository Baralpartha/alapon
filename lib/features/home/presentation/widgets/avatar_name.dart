import 'package:flutter/material.dart';

class AvatarName extends StatelessWidget {
  final String name;

  const AvatarName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundColor: Color(0x22D94141),
          child: Icon(Icons.person, color: Color(0xFFD94141)),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF7E2A2A),
          ),
        ),
      ],
    );
  }
}
