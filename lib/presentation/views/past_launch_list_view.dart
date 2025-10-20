import 'dart:async';

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

class _PastLaunchListViewState extends State<PastLaunchListView> {
  // Controller to detect when the user scrolls near the bottom for pagination
  final ScrollController _scrollController = ScrollController();

  // Controller and state for search functionality
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    // Add listener for infinite scrolling
    _scrollController.addListener(_onScroll);

    // Initial fetch when the widget is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LaunchProvider>(context, listen: false).fetchPastLaunches(
        isInitial: true,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    _debounceTimer?.cancel();
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
      // Fetch the next page of launches, maintaining the current search filter
      notifier.fetchPastLaunches(missionName: _searchQuery);
    }
  }

  /// Handles search query changes with a debounce timer.
  void _onSearchChanged(String query) {
    // 1. Cancel the previous timer if it exists
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();

    // 2. Start a new timer
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (_searchQuery != query) {
        setState(() {
          _searchQuery = query;
        });

        // 3. Trigger a fresh fetch with the new filter
        Provider.of<LaunchProvider>(context, listen: false).fetchPastLaunches(
          isInitial: true,
          missionName: query,
        );
      }
    });
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Search by mission name...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _onSearchChanged('');
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Theme.of(context).cardColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LaunchProvider>(
      builder: (context, notifier, child) {
        // Wrap the body in a RefreshIndicator for pull-to-refresh
        return RefreshIndicator(
          // When pulled, reset state and fetch the first page, maintaining search filter
          onRefresh: () => notifier.fetchPastLaunches(
            isInitial: true,
            missionName: _searchQuery,
          ),
          child: Column(
            children: [
              // 1. Search Bar
              _buildSearchBar(context),

              // 2. Flexible Launch List Body
              Expanded(
                child: _buildBody(notifier),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(LaunchProvider notifier) {
    // 1. Initial Loading State (Loader)
    if (notifier.isPastLoadingInitial && notifier.pastLaunches.isEmpty) {
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
                onPressed: () => notifier.fetchPastLaunches(
                  isInitial: true,
                  missionName: _searchQuery, // Use current filter for retry
                ),
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
              _searchQuery.isEmpty
                  ? 'No past launches found.'
                  : 'No launches found for "$_searchQuery".',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              textAlign: TextAlign.center,
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
}
