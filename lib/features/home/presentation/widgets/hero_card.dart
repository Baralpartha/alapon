import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            /// 🔴 Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/hero_card.png',
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),

            /// 🔴 Left Gradient Overlay (text readable করার জন্য)
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFFF6F6),
                      Color(0xCCFFF6F6),
                      Color(0x00FFFFFF),
                    ],
                    stops: [0.0, 0.45, 1.0],
                  ),
                ),
              ),
            ),

            /// 🔴 Text Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Connect & chat",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF7E2A2A),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "with your colleagues!",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF8B5C5C),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Networking platform\nfor Power Grid employees",
                    style: TextStyle(
                      color: Color(0xFF8B5C5C),
                      height: 1.25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                  _StartButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StartButton extends StatelessWidget {
  const _StartButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFD94141),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Text(
        "Start Chatting",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
