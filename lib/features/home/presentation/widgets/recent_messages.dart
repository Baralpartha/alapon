import 'package:flutter/material.dart';
import 'avatar_name.dart';

class RecentMessages extends StatelessWidget {
  const RecentMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, 10)),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarName(name: "Ahmed"),
          AvatarName(name: "Lily"),
          AvatarName(name: "Sumon"),
          AvatarName(name: "Maitri"),
        ],
      ),
    );
  }
}
