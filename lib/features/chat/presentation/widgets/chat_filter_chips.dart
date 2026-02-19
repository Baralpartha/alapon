import 'package:flutter/material.dart';

class ChatFilterChips extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const ChatFilterChips({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final selected = i == selectedIndex;

          return InkWell(
            onTap: () => onChanged(i),
            borderRadius: BorderRadius.circular(999),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFD94141) : Colors.white,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: const Color(0x22D94141)),
                boxShadow: const [
                  BoxShadow(color: Color(0x0E000000), blurRadius: 10, offset: Offset(0, 5)),
                ],
              ),
              child: Text(
                items[i],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: selected ? Colors.white : const Color(0xFFD94141),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
