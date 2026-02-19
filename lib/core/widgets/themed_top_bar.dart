import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ThemedAppBar extends StatelessWidget {
  final String title;

  // back button
  final bool showBack;
  final VoidCallback? onBack;

  // right side actions (up to 3 like your chat)
  final List<ThemedAppBarAction> actions;

  // size/shape
  final double height;
  final double arcHeight;

  const ThemedAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.onBack,
    this.actions = const [],
    this.height = 96,
    this.arcHeight = 26,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFE35A5A),
                    Color(0xFFD94141),
                    Color(0xFFC93B3B),
                  ],
                ),
              ),
            ),
          ),

          // Curved bottom arc
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: arcHeight,
              decoration: const BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(420, 120),
                ),
              ),
            ),
          ),

          // Content row
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 6, 10, 0),
              child: Row(
                children: [
                  if (showBack)
                    IconButton(
                      onPressed: onBack ?? () => Navigator.maybePop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    )
                  else
                    const SizedBox(width: 48),

                  const SizedBox(width: 2),

                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const Spacer(),

                  for (int i = 0; i < actions.length; i++) ...[
                    _CircleActionButton(action: actions[i]),
                    if (i != actions.length - 1) const SizedBox(width: 10),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThemedAppBarAction {
  final IconData icon;
  final VoidCallback onTap;

  const ThemedAppBarAction({
    required this.icon,
    required this.onTap,
  });
}

class _CircleActionButton extends StatelessWidget {
  final ThemedAppBarAction action;
  const _CircleActionButton({required this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action.onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.22),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.white.withOpacity(0.20)),
        ),
        child: Icon(action.icon, color: Colors.white, size: 18),
      ),
    );
  }
}
