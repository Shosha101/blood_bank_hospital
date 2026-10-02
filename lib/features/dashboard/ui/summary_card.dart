import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:blood_bank_hospital/core/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

/// One figure of the dashboard: a title, a big count and a hint under it.
class SummaryCard extends StatelessWidget {
  final String title;
  final String hint;
  final int count;
  final IconData icon;
  final Color color;
  final Color background;

  const SummaryCard({
    super.key,
    required this.title,
    required this.hint,
    required this.count,
    required this.icon,
    required this.color,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 32,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  hint,
                  style: const TextStyle(fontSize: 12, color: AppColors.hint),
                ),
              ],
            ),
          ),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 26),
          ),
        ],
      ),
    );
  }
}
