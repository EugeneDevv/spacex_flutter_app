import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_flutter_app/presentation/providers/launch_provider.dart';

import '../widgets/launch_card.dart';

class LaunchListScreen extends StatefulWidget {
  const LaunchListScreen({super.key});

  @override
  State<LaunchListScreen> createState() => _LaunchListScreenState();
}

class _LaunchListScreenState extends State<LaunchListScreen> {
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
        !notifier.isFetchingMore && // Prevent multiple requests
        notifier.hasMoreData) {
      // Only fetch if we expect more data
      notifier.fetchPastLaunches();
    }
  }

  // --- UI Building Logic based on Notifier State ---

  Widget _buildBody(LaunchProvider notifier) {
    // 1. Initial Loading State (Loader)
    if (notifier.isLoadingInitial) {
      return const Center(child: CircularProgressIndicator());
    }

    // 2. Error State
    if (notifier.errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text(
                notifier.errorMessage!,
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
    if (notifier.launches.isEmpty) {
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
      itemCount: notifier.launches.length + 1,
      itemBuilder: (context, index) {
        if (index == notifier.launches.length) {
          // This is the pagination footer/load more indicator
          if (notifier.isFetchingMore) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            );
          } else if (!notifier.hasMoreData) {
            // End of results message
            return const Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(
                child: Text(
                  'End of the Launch History.',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ),
            );
          }
          // Default empty space if we still have more data but haven't triggered a fetch yet
          return const SizedBox(height: 24);
        }

        // Standard Launch Card item
        final launch = notifier.launches[index];
        return LaunchCard(launch: launch);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // We use a Builder here to provide a Scrollable view for the RefreshIndicator
    return Scaffold(
      body: Consumer<LaunchProvider>(
        builder: (context, notifier, child) {
          // Wrap the body in a RefreshIndicator for pull-to-refresh
          return RefreshIndicator(
            // When pulled, reset state and fetch the first page
            onRefresh: () => notifier.fetchPastLaunches(isInitial: true),
            child: _buildBody(notifier),
          );
        },
      ),
    );
  }
}
