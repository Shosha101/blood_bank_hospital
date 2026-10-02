import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:blood_bank_hospital/core/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// One destination in the sidebar.
class SidebarItem {
  final IconData icon;
  final String labelKey;
  const SidebarItem(this.icon, this.labelKey);
}

/// Fixed navigation rail of the dashboard. It sits at the start edge, so it is on
/// the right in Arabic. Below 1100px it shrinks to icons only.
class AppSidebar extends StatelessWidget {
  static const List<SidebarItem> items = [
    SidebarItem(Icons.dashboard_outlined, 'nav_dashboard'),
    SidebarItem(Icons.inventory_2_outlined, 'nav_inventory'),
    SidebarItem(Icons.history, 'nav_past_requests'),
    SidebarItem(Icons.settings_outlined, 'nav_settings'),
  ];

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final VoidCallback onLogout;

  const AppSidebar({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.of(context).size.width < 1100;

    return Container(
      width: compact ? 76 : 248,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: BorderDirectional(end: BorderSide(color: AppColors.border)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 12 : 16,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: compact
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              const AppLogo(size: 40),
              if (!compact) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr('app_name'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.text,
                        ),
                      ),
                      Text(
                        context.tr('app_role'),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 28),
          for (var i = 0; i < items.length; i++)
            _SidebarTile(
              icon: items[i].icon,
              label: context.tr(items[i].labelKey),
              selected: i == selectedIndex,
              compact: compact,
              onTap: () => onSelected(i),
            ),
          const Spacer(),
          const Divider(color: AppColors.border, height: 24),
          _SidebarTile(
            icon: Icons.logout_rounded,
            label: context.tr('logout'),
            selected: false,
            compact: compact,
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final bool compact;
  final VoidCallback onTap;

  const _SidebarTile({
    required this.icon,
    required this.label,
    required this.selected,
    required this.compact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.white : AppColors.muted;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: selected ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Tooltip(
            message: compact ? label : '',
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: compact ? 0 : 12,
                vertical: 11,
              ),
              child: Row(
                mainAxisAlignment: compact
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Icon(icon, size: 20, color: color),
                  if (!compact) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        label,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: selected ? Colors.white : AppColors.text,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
