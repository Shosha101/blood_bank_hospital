import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

/// Rounded tile with the blood-drop mark, used as the app logo.
class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(size * 0.28),
      ),
      child: Icon(
        Icons.water_drop_rounded,
        color: Colors.white,
        size: size * 0.56,
      ),
    );
  }
}

/// Switches between Arabic and English; the label names the other language.
class LanguagePill extends StatelessWidget {
  const LanguagePill({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return Material(
      color: AppColors.surface,
      shape: const StadiumBorder(side: BorderSide(color: AppColors.border)),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: () => context.setLocale(Locale(isArabic ? 'en' : 'ar')),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.language, size: 16, color: AppColors.muted),
              const SizedBox(width: 6),
              Text(
                context.tr('other_language'),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// White card with the standard border and radius.
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color borderColor;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.color = AppColors.surface,
    this.borderColor = AppColors.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.text.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

/// Title and subtitle above a section, with an optional action at the end.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? action;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(fontSize: 13, color: AppColors.muted),
                ),
            ],
          ),
        ),
        if (action != null) action!,
      ],
    );
  }
}

/// Circle with a blood type in it. Blood types always read left to right.
class BloodBadge extends StatelessWidget {
  final String bloodType;
  final double size;

  const BloodBadge({super.key, required this.bloodType, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.primarySoft,
        shape: BoxShape.circle,
      ),
      child: Text(
        bloodType,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: size * 0.34,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

/// How a status coming from the API is named and coloured.
class StatusStyle {
  final String labelKey;
  final Color background;
  final Color foreground;
  const StatusStyle(this.labelKey, this.background, this.foreground);

  static StatusStyle? of(String status) {
    switch (status.replaceAll(' ', '').toLowerCase()) {
      case 'open':
        return const StatusStyle(
          'status_open',
          AppColors.warningSoft,
          AppColors.warning,
        );
      case 'pending':
        return const StatusStyle(
          'status_pending',
          AppColors.warningSoft,
          AppColors.warning,
        );
      case 'inprogress':
        return const StatusStyle(
          'status_in_progress',
          AppColors.infoSoft,
          AppColors.info,
        );
      case 'completed':
        return const StatusStyle(
          'status_completed',
          AppColors.successSoft,
          AppColors.success,
        );
      case 'cancelled':
      case 'canceled':
        return const StatusStyle(
          'status_cancelled',
          AppColors.neutralSoft,
          AppColors.muted,
        );
      case 'available':
        return const StatusStyle(
          'status_available',
          AppColors.successSoft,
          AppColors.success,
        );
      case 'lowstock':
        return const StatusStyle(
          'status_low_stock',
          AppColors.warningSoft,
          AppColors.warning,
        );
      case 'outofstock':
      case 'notavailable':
        return const StatusStyle(
          'status_out_of_stock',
          AppColors.primarySoft,
          AppColors.primary,
        );
    }
    return null;
  }
}

/// Pill that names a request or stock status; unknown statuses show as received.
class StatusChip extends StatelessWidget {
  final String status;
  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final style = StatusStyle.of(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: style?.background ?? AppColors.neutralSoft,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        style != null ? context.tr(style.labelKey) : status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: style?.foreground ?? AppColors.muted,
        ),
      ),
    );
  }
}

/// Centered icon, title and optional body and action: empty and error states.
class StateMessage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? body;
  final String? actionLabel;
  final VoidCallback? onAction;

  const StateMessage({
    super.key,
    required this.icon,
    required this.title,
    this.body,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: AppColors.primarySoft,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 30),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
          if (body != null) ...[
            const SizedBox(height: 4),
            Text(
              body!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: AppColors.muted),
            ),
          ],
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: 180,
              child: FilledButton(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A table inside a card: header row, then one row per item, scrolling sideways when narrow.
class AppTable extends StatelessWidget {
  final List<String> columns;
  final List<List<Widget>> rows;

  /// Relative widths of the columns.
  final List<int> flex;

  const AppTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth < 720 ? 720.0 : constraints.maxWidth;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                    border: Border(bottom: BorderSide(color: AppColors.border)),
                  ),
                  child: Row(
                    children: [
                      for (var i = 0; i < columns.length; i++)
                        Expanded(
                          flex: flex[i],
                          child: Text(
                            columns[i],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.muted,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                for (var r = 0; r < rows.length; r++)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: r == rows.length - 1
                          ? null
                          : const Border(
                              bottom: BorderSide(color: AppColors.border),
                            ),
                    ),
                    child: Row(
                      children: [
                        for (var i = 0; i < columns.length; i++)
                          Expanded(
                            flex: flex[i],
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: rows[r][i],
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Plain text cell for [AppTable]; `ltr` keeps IDs and dates in their written order.
class CellText extends StatelessWidget {
  final String text;
  final bool ltr;
  final bool strong;

  const CellText(this.text, {super.key, this.ltr = false, this.strong = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: ltr ? TextDirection.ltr : null,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        fontWeight: strong ? FontWeight.w600 : FontWeight.w400,
        color: AppColors.text,
      ),
    );
  }
}

/// Formats an API date-time string as dd/MM/yyyy HH:mm, falling back to the raw text.
String formatApiDateTime(String raw) {
  final date = DateTime.tryParse(raw);
  if (date == null) return raw;
  String two(int n) => n.toString().padLeft(2, '0');
  return '${two(date.day)}/${two(date.month)}/${date.year} ${two(date.hour)}:${two(date.minute)}';
}
