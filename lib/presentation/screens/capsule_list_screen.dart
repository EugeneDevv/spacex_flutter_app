import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_flutter_app/core/utils/localization/language_constants.dart';
import 'package:spacex_flutter_app/presentation/providers/capsule_provider.dart';
import 'package:spacex_flutter_app/presentation/views/capsule_grid_view.dart';
import 'package:spacex_flutter_app/presentation/views/capsule_list_view.dart';
import 'package:spacex_flutter_app/presentation/widgets/custom_app_bar_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/error_state_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/zero_state_widget.dart';

class CapsulesListScreen extends StatefulWidget {
  const CapsulesListScreen({super.key});

  @override
  State<CapsulesListScreen> createState() => _CapsulesListScreenState();
}

class _CapsulesListScreenState extends State<CapsulesListScreen> {
  bool showGridView = true;

  // Controller to detect when the user scrolls near the bottom for pagination
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add listener for infinite scrolling
    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Fetch initial capsules data when the widget is first built
      Provider.of<CapsuleProvider>(context, listen: false)
          .fetchCapsules(isInitial: true);
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
    final notifier = Provider.of<CapsuleProvider>(context, listen: false);

    // Check if scroll position is within 100 pixels of the end
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !notifier.isFetchingMore && // Prevent multiple requests
        notifier.hasMoreData) {
      // Only fetch if we expect more data
      notifier.fetchCapsules();
    }
  }

  @override
  Widget build(BuildContext context) {
    // --- UI Building Logic based on Notifier State ---

    Widget buildBody(CapsuleProvider notifier) {
      // 1. Initial Loading State (Loader)
      if (notifier.isLoadingInitial) {
        return const Center(child: CircularProgressIndicator());
      }

      // 2. Error State
      if (notifier.errorMessage != null) {
        return ErrorStateWidget(
          errorMessage: notifier.errorMessage,
          callBack: () => notifier.fetchCapsules(isInitial: true),
        );
      }

      // 3. Empty State (No Data)
      if (notifier.capsules.isEmpty) {
        return ZeroStateWidget(
          callBack: () => notifier.fetchCapsules(isInitial: true),
        );
      }

      // 4. Data List View with Pagination Footer
      return showGridView
          ? CapsuleGridView(
              capsules: notifier.capsules,
              scrollController: _scrollController,
              isFetchingMore: notifier.isFetchingMore,
              hasMoreData: notifier.hasMoreData,
            )
          : CapsuleListView(
              capsules: notifier.capsules,
              scrollController: _scrollController,
              isFetchingMore: notifier.isFetchingMore,
              hasMoreData: notifier.hasMoreData,
            );
    }

    return Consumer<CapsuleProvider>(
      builder: (context, notifier, child) {
        // Wrap the body in a RefreshIndicator for pull-to-refresh
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
              leadingWidget: IconButton(
                  onPressed: () => setState(() {
                        showGridView = !showGridView;
                      }),
                  icon: Icon(
                    showGridView ? Icons.list : Icons.grid_view,
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
              showBackButton: false,
              title: getTranslated(context, 'capsules') ?? 'Capsules'),
          body: RefreshIndicator(
            // When pulled, reset state and fetch the first page
            onRefresh: () => notifier.fetchCapsules(isInitial: true),
            child: buildBody(notifier),
          ),
        );
      },
    );
  }
}
