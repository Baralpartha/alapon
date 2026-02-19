import 'package:flutter/material.dart';

import '../../../../core/widgets/themed_top_bar.dart';

class ChatAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final VoidCallback onAdd;
  final VoidCallback onSearch;
  final VoidCallback onLock;

  const ChatAppBar({
    super.key,
    required this.title,
    required this.onBack,
    required this.onAdd,
    required this.onSearch,
    required this.onLock,
  });

  @override
  Widget build(BuildContext context) {
    return ThemedAppBar(
      title: title,
      onBack: onBack,
      actions: [
        ThemedAppBarAction(icon: Icons.add_circle_outline_rounded, onTap: onAdd),
        ThemedAppBarAction(icon: Icons.search_rounded, onTap: onSearch),
        ThemedAppBarAction(icon: Icons.lock_outline_rounded, onTap: onLock),
      ],
    );
  }
}
