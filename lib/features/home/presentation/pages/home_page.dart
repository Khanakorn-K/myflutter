import 'package:flutter/material.dart';
import 'package:myflutter/features/home/presentation/view_model/home_viewmodel.dart';
import 'package:myflutter/features/home/presentation/widgets/counter.dart';
import 'package:myflutter/features/home/presentation/widgets/home_banner.dart';
import 'package:myflutter/features/home/presentation/widgets/home_header.dart';
import 'package:myflutter/features/home/presentation/widgets/home_item_card.dart';
import 'package:myflutter/features/home/presentation/widgets/quick_actions.dart';

/// Page รับ ViewModel ผ่าน constructor (constructor injection).
/// ห้ามเรียก `sl<>()` ใน presentation ตรงๆ เพื่อให้ test ได้ง่าย.
/// Composition root (main/app.dart) เท่านั้นที่รู้จัก GetIt.
class HomePage extends StatefulWidget {
  final HomeViewModel homeViewModel;

  const HomePage({super.key, required this.homeViewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    if (widget.homeViewModel.items.isEmpty &&
        !widget.homeViewModel.isLoading &&
        widget.homeViewModel.errorMessage == null) {
      widget.homeViewModel.handleOnAppear();
    }
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.homeViewModel, widget.homeViewModel)) {
      widget.homeViewModel.handleOnAppear();
    }
  }

  void _showFeedback(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        bottom: false,
        child: ListenableBuilder(
          listenable: widget.homeViewModel,
          builder: (context, _) {
            final vm = widget.homeViewModel;

            return RefreshIndicator(
              color: colorScheme.primary,
              backgroundColor: colorScheme.surfaceContainerHighest,
              onRefresh: () => vm.handleOnAppear(),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                children: [
                  // 1. Header with greeting and profile
                  HomeHeader(
                    onNotificationTap: () => _showFeedback('No new notifications'),
                    onSearchTap: () => _showFeedback('Search feature coming soon'),
                  ),
                  const SizedBox(height: 20),

                  // 2. Featured Banner Card
                  HomeBanner(
                    onExploreTap: () => _showFeedback('Exploring features'),
                  ),
                  const SizedBox(height: 24),

                  // 3. Quick Actions
                  QuickActionsSection(
                    onActionTap: (action) => _showFeedback('$action selected'),
                  ),
                  const SizedBox(height: 28),

                  // 4. Section: Featured Items (ViewModel items)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Featured Items',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.2,
                            ),
                          ),
                          if (vm.items.isNotEmpty) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primary.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${vm.items.length}',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      IconButton(
                        tooltip: 'Refresh data',
                        icon: const Icon(Icons.refresh_rounded, size: 20),
                        onPressed: vm.isLoading ? null : () => vm.handleOnAppear(),
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Content state based on ViewModel
                  if (vm.isLoading && vm.items.isEmpty) ...[
                    _buildLoadingSkeleton(colorScheme),
                  ] else if (vm.errorMessage != null && vm.items.isEmpty) ...[
                    _buildErrorCard(context, vm),
                  ] else if (vm.items.isEmpty) ...[
                    _buildEmptyState(context),
                  ] else ...[
                    for (int i = 0; i < vm.items.length; i++) ...[
                      if (i > 0) const SizedBox(height: 10),
                      HomeItemCard(
                        item: vm.items[i],
                        onTap: () => _showFeedback('Selected ${vm.items[i].title}'),
                      ),
                    ],
                  ],

                  const SizedBox(height: 28),

                  // 5. Section: Interactive Counter Component
                  Text(
                    'Interactive Component',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Counter(),

                  // Bottom padding to avoid overlap with floating CrystalNavigationBar
                  const SizedBox(height: 120),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingSkeleton(ColorScheme colorScheme) {
    return Column(
      children: List.generate(
        2,
        (index) => Container(
          margin: EdgeInsets.only(bottom: index == 0 ? 10 : 0),
          height: 72,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorCard(BuildContext context, HomeViewModel vm) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: colorScheme.error.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline_rounded, color: colorScheme.error, size: 36),
          const SizedBox(height: 10),
          Text(
            vm.errorMessage ?? 'An unexpected error occurred',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onErrorContainer,
            ),
          ),
          const SizedBox(height: 14),
          FilledButton.tonalIcon(
            onPressed: () => vm.handleOnAppear(),
            icon: const Icon(Icons.refresh_rounded, size: 18),
            label: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 40,
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 8),
            Text(
              'No items available',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
