import 'package:flutter/material.dart';

class QuickActionsGrid extends StatelessWidget {
  final void Function(ActionItem item)? onItemTap;

  const QuickActionsGrid({super.key, this.onItemTap});

  @override
  Widget build(BuildContext context) {
    final items = [
      ActionItem("Login", Icons.login_rounded, 0),
      ActionItem("To-Do", Icons.task_alt_rounded, 0),
      ActionItem("Meeting", Icons.calendar_month_rounded, 0),
      ActionItem("Office", Icons.apartment_rounded, 0),
      ActionItem("Messages", Icons.chat_bubble_outline_rounded, 0),
      ActionItem("Notice", Icons.campaign_rounded, 3),
      ActionItem("Inbox", Icons.mark_unread_chat_alt_rounded, 24),
      ActionItem("Contacts", Icons.contacts_rounded, 0),
    ];

    const tileHeight = 92.0;
    const spacing = 12.0;
    const columns = 4;

    return LayoutBuilder(
      builder: (context, constraints) {
        final tileWidth = (constraints.maxWidth - (spacing * (columns - 1))) / columns;
        final aspectRatio = tileWidth / tileHeight;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (context, i) {
            return ActionTile(
              item: items[i],
              onTap: () => onItemTap?.call(items[i]),
            );
          },
        );
      },
    );
  }
}

class ActionItem {
  final String title;
  final IconData icon;
  final int badge;
  const ActionItem(this.title, this.icon, this.badge);
}

class ActionTile extends StatelessWidget {
  final ActionItem item;
  final VoidCallback onTap;

  const ActionTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 16,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: const SizedBox.expand(),
          ),

          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, color: const Color(0xFFD94141), size: 26),
                  const SizedBox(height: 8),
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF7E2A2A),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (item.badge > 0)
            Positioned(
              top: -6,
              right: -6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFD94141),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  "${item.badge}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
