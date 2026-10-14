import 'package:flutter/material.dart';

class QuickActionItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final VoidCallback? onTap;

  const QuickActionItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    this.onTap,
  });
}

class QuickActionsSection extends StatelessWidget {
  final ValueChanged<String>? onActionTap;

  const QuickActionsSection({super.key, this.onActionTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final items = [
      QuickActionItem(
        title: 'Insights',
        subtitle: 'Analytics',
        icon: Icons.insights_rounded,
        accentColor: colorScheme.primary,
        onTap: () => onActionTap?.call('Insights'),
      ),
      QuickActionItem(
        title: 'Activity',
        subtitle: 'Realtime',
        icon: Icons.bolt_rounded,
        accentColor: const Color(0xFFFFB74D),
        onTap: () => onActionTap?.call('Activity'),
      ),
      QuickActionItem(
        title: 'Bookmarks',
        subtitle: 'Saved list',
        icon: Icons.bookmark_border_rounded,
        accentColor: const Color(0xFFFF4081),
        onTap: () => onActionTap?.call('Bookmarks'),
      ),
      QuickActionItem(
        title: 'Preferences',
        subtitle: 'System',
        icon: Icons.tune_rounded,
        accentColor: const Color(0xFF7C4DFF),
        onTap: () => onActionTap?.call('Preferences'),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Quick Actions',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: -0.2,
              ),
            ),
            Text(
              '4 shortcuts',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            for (int i = 0; i < items.length; i++) ...[
              if (i > 0) const SizedBox(width: 10),
              Expanded(child: _ActionCard(item: items[i])),
            ],
          ],
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final QuickActionItem item;

  const _ActionCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: item.accentColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item.icon,
                  size: 20,
                  color: item.accentColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item.title,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                item.subtitle,
                style: TextStyle(
                  fontSize: 10,
                  color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
