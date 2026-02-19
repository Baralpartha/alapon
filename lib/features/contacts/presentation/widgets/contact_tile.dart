import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ContactUiModel {
  final String name;
  final String designation;
  final String department;
  final String phone;
  final bool online;

  const ContactUiModel(this.name, this.designation, this.department, this.phone, this.online);
}

class ContactTile extends StatelessWidget {
  final ContactUiModel model;
  final VoidCallback onCall;
  final VoidCallback onMessage;

  const ContactTile({
    super.key,
    required this.model,
    required this.onCall,
    required this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6F6),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0x11D94141)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Color(0x22D94141),
                child: Icon(Icons.person_rounded, color: AppColors.primaryRed),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: model.online ? const Color(0xFF2F7D3B) : const Color(0xFFB0B0B0),
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  model.designation,
                  style: const TextStyle(
                    color: AppColors.primaryRed,
                    fontWeight: FontWeight.w800,
                    fontSize: 12.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "${model.department} • ${model.phone}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSoft,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          _CircleBtn(icon: Icons.call_rounded, onTap: onCall),
          const SizedBox(width: 8),
          _CircleBtn(icon: Icons.chat_bubble_rounded, onTap: onMessage),
        ],
      ),
    );
  }
}

class _CircleBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: const Color(0x22D94141)),
        ),
        child: Icon(icon, color: AppColors.primaryRed, size: 18),
      ),
    );
  }
}
