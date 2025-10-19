import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_flutter_app/core/utils/colors.dart';
import 'package:spacex_flutter_app/presentation/providers/launch_provider.dart';
import 'package:spacex_flutter_app/presentation/widgets/launch_card.dart';

class PastLaunchListView extends StatefulWidget {
  const PastLaunchListView({super.key});

  @override
  State<PastLaunchListView> createState() => _PastLaunchListViewState();
}

class _PastLaunchListViewState extends State<PastLaunchListView>{

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
        !notifier.isPastFetchingMore && // Prevent multiple requests
        notifier.pastHasMoreData) {
      // Only fetch if we expect more data
      notifier.fetchPastLaunches();
    }
  }
  @override
  Widget build(BuildContext context) {

      // --- UI Building Logic based on Notifier State ---

    Widget buildBody(LaunchProvider notifier) {
      // 1. Initial Loading State (Loader)
      if (notifier.isPastLoadingInitial) {
        return const Center(child: CircularProgressIndicator());
      }

      // 2. Error State
      if (notifier.pastErrorMessage != null) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(
                  notifier.pastErrorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.redAccent),
                ),
                const SizedBox(height: 16),
                // Button to retry fetching
                ElevatedButton.icon(
                  onPressed: () => notifier.fetchPastLaunches(isInitial: true),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try Again'),
                ),
              ],
            ),
          ),
        );
      }

      // 3. Empty State (No Data)
      if (notifier.pastLaunches.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.satellite_alt_outlined,
                  size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                'No past launches found.',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ],
          ),
        );
      }

      // 4. Data List View with Pagination Footer
      return ListView.builder(
        controller: _scrollController,
        // Add 1 to the item count to reserve space for the pagination footer/indicator
        itemCount: notifier.pastLaunches.length + 1,
        itemBuilder: (context, index) {
          if (index == notifier.pastLaunches.length) {
            // This is the pagination footer/load more indicator
            if (notifier.isPastFetchingMore) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              );
            } else if (!notifier.pastHasMoreData) {
              // End of results message
              return const Padding(
                padding: EdgeInsets.all(24.0),
                child: Center(
                  child: Text(
                    'End of the Launch History.',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: AppColors.lightGrey),
                  ),
                ),
              );
            }
            // Default empty space if we still have more data but haven't triggered a fetch yet
            return const SizedBox(height: 24);
          }

          // Standard Launch Card item
          final launch = notifier.pastLaunches[index];
          return LaunchCard(launch: launch);
        },
      );
    }
    
    return Consumer<LaunchProvider>(
      builder: (context, notifier, child) {
        // Wrap the body in a RefreshIndicator for pull-to-refresh
        return RefreshIndicator(
          // When pulled, reset state and fetch the first page
          onRefresh: () => notifier.fetchPastLaunches(isInitial: true),
          child: buildBody(notifier),
        );
      },
    );
  }
}
