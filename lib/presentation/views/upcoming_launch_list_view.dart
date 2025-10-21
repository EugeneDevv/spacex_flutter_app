import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:spacex_flutter_app/core/utils/colors.dart';
import 'package:spacex_flutter_app/presentation/providers/launch_provider.dart';
import 'package:spacex_flutter_app/presentation/widgets/error_state_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/launch_card.dart';
import 'package:spacex_flutter_app/presentation/widgets/zero_state_widget.dart';

class UpcomingLaunchListView extends StatefulWidget {
  const UpcomingLaunchListView({super.key});

  @override
  State<UpcomingLaunchListView> createState() => _UpcomingLaunchListViewState();
}

class _UpcomingLaunchListViewState extends State<UpcomingLaunchListView> {
  // Controller to detect when the user scrolls near the bottom for pagination
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add listener for infinite scrolling
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  /// Checks scroll position and requests more data if near the bottom.
  void _onScroll() {
    final notifier = Provider.of<LaunchProvider>(context, listen: false);

    // Check if scroll position is within 100 pixels of the end
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !notifier.isUpcomingFetchingMore && // Prevent multiple requests
        notifier.upcomingHasMoreData) {
      // Only fetch if we expect more data
      notifier.fetchUpcomingLaunches();
    }
  }

  @override
  Widget build(BuildContext context) {
    // --- UI Building Logic based on Notifier State ---

    Widget buildBody(LaunchProvider notifier) {
      // 1. Initial Loading State (Loader)
      if (notifier.isUpcomingLoadingInitial) {
        return const Center(child: CircularProgressIndicator());
      }

      // 2. Error State
      if (notifier.upcomingErrorMessage != null) {
        return ErrorStateWidget(
          errorMessage: notifier.upcomingErrorMessage,
          callBack: () => notifier.fetchUpcomingLaunches(isInitial: true),
        );
      }

      // 3. Empty State (No Data)
      if (notifier.upcomingLaunches.isEmpty) {
        return ZeroStateWidget(
          callBack: () => notifier.fetchUpcomingLaunches(isInitial: true),
        );
      }

      // 4. Data List View with Pagination Footer
      return AnimationLimiter(
        child: ListView.builder(
          controller: _scrollController,
          // Add 1 to the item count to reserve space for the pagination footer/indicator
          itemCount: notifier.upcomingLaunches.length + 1,
          itemBuilder: (context, index) {
            if (index == notifier.upcomingLaunches.length) {
              // This is the pagination footer/load more indicator
              if (notifier.isUpcomingFetchingMore) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child:
                      Center(child: CircularProgressIndicator(strokeWidth: 2)),
                );
              } else if (!notifier.upcomingHasMoreData) {
                // End of results message
                return const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      'End of the Launch History.',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColors.lightGrey),
                    ),
                  ),
                );
              }
              // Default empty space if we still have more data but haven't triggered a fetch yet
              return const SizedBox(height: 24);
            }

            // Standard Launch Card item
            final launch = notifier.upcomingLaunches[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                horizontalOffset: 50,
                child: FadeInAnimation(
                  child: LaunchCard(launch: launch),
                ),
              ),
            );
          },
        ),
      );
    }

    return Consumer<LaunchProvider>(
      builder: (context, notifier, child) {
        // Wrap the body in a RefreshIndicator for pull-to-refresh
        return RefreshIndicator(
          // When pulled, reset state and fetch the first page
          onRefresh: () => notifier.fetchUpcomingLaunches(isInitial: true),
          child: buildBody(notifier),
        );
      },
    );
  }
}
