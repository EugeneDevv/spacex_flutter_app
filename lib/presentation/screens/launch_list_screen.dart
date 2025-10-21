import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/core/utils/colors.dart';
import 'package:spacex_flutter_app/core/utils/localization/language_constants.dart';
import 'package:spacex_flutter_app/presentation/views/past_launch_list_view.dart';
import 'package:spacex_flutter_app/presentation/views/upcoming_launch_list_view.dart';
import 'package:spacex_flutter_app/presentation/widgets/custom_app_bar_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/spaces.dart';

class LaunchListScreen extends StatefulWidget {
  const LaunchListScreen({super.key});

  @override
  State<LaunchListScreen> createState() => _LaunchListScreenState();
}

class _LaunchListScreenState extends State<LaunchListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We use a Builder here to provide a Scrollable view for the RefreshIndicator
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
          showBackButton: false,
          title: getTranslated(context, 'launches') ?? 'Launches'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                // Darker color for the selected tab
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              // Ensure the indicator covers the whole tab area
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 0,
              indicatorPadding: EdgeInsets.zero,

              // Color for selected and unselected labels
              labelColor: Theme.of(context).colorScheme.onPrimary,
              unselectedLabelColor: AppColors.lightGrey,
              tabs: [
                Tab(text: getTranslated(context, 'upcoming') ?? 'Upcoming'),
                Tab(text: getTranslated(context, 'past') ?? 'Past'),
              ],
            ),
            verySmallVerticalSizedBox,
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  UpcomingLaunchListView(),
                  PastLaunchListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
