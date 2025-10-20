import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_flutter_app/presentation/providers/rocket_provider.dart';
import 'package:spacex_flutter_app/presentation/widgets/custom_app_bar_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/rocket_card.dart';

class RocketListScreen extends StatefulWidget {
  const RocketListScreen({super.key});

  @override
  State<RocketListScreen> createState() => _RocketListScreenState();
}

class _RocketListScreenState extends State<RocketListScreen> {
  // Controller to detect when the user scrolls near the bottom for pagination
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add listener for infinite scrolling
    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Fetch initial rockets data when the widget is first built
      Provider.of<RocketProvider>(context, listen: false)
          .fetchRockets(isInitial: true);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  /// Checks scroll position and requests more data if near the bottom.
  void _onScroll() {
    final notifier = Provider.of<RocketProvider>(context, listen: false);

    // Check if scroll position is within 100 pixels of the end
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !notifier.isFetchingMore && // Prevent multiple requests
        notifier.hasMoreData) {
      // Only fetch if we expect more data
      notifier.fetchRockets();
    }
  }

  @override
  Widget build(BuildContext context) {
    // --- UI Building Logic based on Notifier State ---

    Widget buildBody(RocketProvider notifier) {
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
                  onPressed: () => notifier.fetchRockets(isInitial: true),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try Again'),
                ),
              ],
            ),
          ),
        );
      }

      // 3. Empty State (No Data)
      if (notifier.rockets.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.satellite_alt_outlined,
                  size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                'No rockets found.',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ],
          ),
        );
      }

      // 4. Data List View with Pagination Footer
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          controller: _scrollController,
          // Add 1 to the item count to reserve space for the pagination footer/indicator
          itemCount: notifier.rockets.length + 1,
          itemBuilder: (context, index) {
            if (index == notifier.rockets.length) {
              // This is the pagination footer/load more indicator
              if (notifier.isFetchingMore) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child:
                      Center(child: CircularProgressIndicator(strokeWidth: 2)),
                );
              }
              // Default empty space if we still have more data but haven't triggered a fetch yet
              return const SizedBox(height: 24);
            }

            final rocket = notifier.rockets[index];
            return RocketCard(rocket: rocket);
          },
        ),
      );
    }

    return Consumer<RocketProvider>(
      builder: (context, notifier, child) {
        // Wrap the body in a RefreshIndicator for pull-to-refresh
        return Scaffold(
          appBar: const CustomAppBar(showBackButton: false, title: 'Rockets'),
          body: RefreshIndicator(
            // When pulled, reset state and fetch the first page
            onRefresh: () => notifier.fetchRockets(isInitial: true),
            child: buildBody(notifier),
          ),
        );
      },
    );
  }
}
