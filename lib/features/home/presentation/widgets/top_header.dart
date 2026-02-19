import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  final String name;
  final int notificationCount;

  const TopHeader({
    super.key,
    required this.name,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundColor: Color(0x22D94141),
          child: Icon(Icons.person, color: Color(0xFFD94141)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Afternoon,",
                style: TextStyle(
                  color: const Color(0xFF8B5C5C).withOpacity(0.95),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "$name!",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF7E2A2A),
                ),
              ),
            ],
          ),
        ),
        _BellBadge(count: notificationCount),
      ],
    );
  }
}

class _BellBadge extends StatelessWidget {
  final int count;
  const _BellBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, 8)),
              ],
            ),
            child: const Icon(Icons.notifications_none_rounded, color: Color(0xFFD94141)),
          ),
          if (count > 0)
            Positioned(
              right: -4,
              top: -4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFD94141),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  "$count",
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900),
                ),
              ),
            )
        ],
      ),
    );
  }
}
