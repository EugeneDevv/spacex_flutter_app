// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spacex_flutter_app/core/utils/colors.dart';
import 'package:spacex_flutter_app/core/utils/localization/language_constants.dart';
import 'package:spacex_flutter_app/domain/entities/app_assets.dart';
import 'package:spacex_flutter_app/presentation/screens/settings_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/launch_list_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/capsule_list_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/mission_list_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/rocket_list_screen.dart';
import 'package:spacex_flutter_app/presentation/utils/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;
  // Define a breakpoint for switching between phone and tablet/desktop layout
  static const double _tabletBreakpoint = 600.0;

  // The list of pages corresponding to the nav items
  final List<Widget> _pages = [
    const CapsulesListScreen(),
    const RocketListScreen(),
    // Launch list screen is the center FAB/Rail target
    const LaunchListScreen(),
    const MissionListScreen(),
    const SettingsScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// Helper to create BottomNavigationBarItem
  BottomNavigationBarItem _bottomNavItem({
    required String assetSvgPath,
    required String labelText,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: assetSvgPath.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: SvgPicture.asset(
                assetSvgPath,
                color: isSelected
                    ? AppColors.secondary
                    : AppColors.lightSurface.withOpacity(0.6),
                width: 24, // Consistent size
                height: 24,
              ),
            )
          : const SizedBox(),
      label: labelText,
    );
  }

  /// Build the layout for wide screens (Navigation Rail)
  Widget _buildWideLayout(BuildContext context) {
    // The Row is now only the BODY content below the AppBar
    return Row(
      children: [
        // The NavigationRail now starts below the AppBar
        NavigationRail(
          backgroundColor: AppColors.darkCardColor,
          selectedIndex: _currentIndex,
          onDestinationSelected: _onTap,
          labelType: NavigationRailLabelType.all,
          unselectedIconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6)),
          selectedLabelTextStyle: const TextStyle(
              color: AppColors.secondary,
              fontSize: 12,
              fontWeight: FontWeight.bold),
          unselectedLabelTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
              fontSize: 12),
          destinations: [
            NavigationRailDestination(
              icon: SvgPicture.asset(SpaceXSvgs.rocketLaunchPadIcon,
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
                  width: 24,
                  height: 24),
              selectedIcon: SvgPicture.asset(SpaceXSvgs.rocketLaunchPadIcon,
                  color: AppColors.secondary, width: 24, height: 24),
              label: const Text('Capsules'),
            ),
            NavigationRailDestination(
              icon: SvgPicture.asset(SpaceXSvgs.rocketIcon,
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
                  width: 24,
                  height: 24),
              selectedIcon: SvgPicture.asset(SpaceXSvgs.rocketIcon,
                  color: AppColors.secondary, width: 24, height: 24),
              label: const Text('Rockets'),
            ),
            // Placeholder destination for the launch screen (Index 2) - Label only
            NavigationRailDestination(
              icon: SvgPicture.asset(SpaceXSvgs.rocketLaunchIcon,
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
                  width: 24,
                  height: 24),
              selectedIcon: SvgPicture.asset(SpaceXSvgs.rocketLaunchIcon,
                  color: AppColors.secondary, width: 24, height: 24),
              label: Text('Launches'),
            ),
            NavigationRailDestination(
              icon: SvgPicture.asset(SpaceXSvgs.missionIcon,
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
                  width: 24,
                  height: 24),
              selectedIcon: SvgPicture.asset(SpaceXSvgs.missionIcon,
                  color: AppColors.secondary, width: 24, height: 24),
              label: const Text('Missions'),
            ),
            NavigationRailDestination(
              icon: SvgPicture.asset(SpaceXSvgs.settingsIcon,
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
                  width: 24,
                  height: 24),
              selectedIcon: SvgPicture.asset(SpaceXSvgs.settingsIcon,
                  color: AppColors.secondary, width: 24, height: 24),
              label: Text(getTranslated(context, 'settings') ?? 'Settings'),
            ),
          ],
        ),
        // Vertical Divider between nav and content
        const VerticalDivider(
            width: 1, thickness: 1, color: AppColors.lightGrey),
        // Content Area takes the rest of the space
        Expanded(
          child: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
        ),
      ],
    );
  }

  /// Build the layout for compact screens (Bottom Nav Bar + FAB)
  Widget _buildCompactLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // Prevents body from resizing when keyboard opens
      resizeToAvoidBottomInset: false,

      // IndexedStack is key for state preservation.
      body: buildBackgroundBody(
          context,
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          )),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.darkCardColor, // Dark background
        selectedItemColor: AppColors.secondary, // Vibrant accent color
        unselectedItemColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          _bottomNavItem(
              assetSvgPath: SpaceXSvgs.rocketLaunchPadIcon,
              labelText: 'Capsules',
              isSelected: _currentIndex == 0),
          _bottomNavItem(
              assetSvgPath: SpaceXSvgs.rocketIcon,
              labelText: 'Rockets',
              isSelected: _currentIndex == 1),
          _bottomNavItem(
              assetSvgPath: '',
              labelText: '',
              isSelected: _currentIndex == 2), // Empty item for FAB spacing
          _bottomNavItem(
              assetSvgPath: SpaceXSvgs.missionIcon,
              labelText: 'Missions',
              isSelected: _currentIndex == 3),
          _bottomNavItem(
              assetSvgPath: SpaceXSvgs.settingsIcon,
              labelText: getTranslated(context, 'settings') ?? 'Settings',
              isSelected: _currentIndex == 4),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        width: 64,
        height: 64,
        padding: const EdgeInsets.all(6.0),
        margin: const EdgeInsets.only(top: 32.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.darkCardColor,
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              _onTap(2);
            },
            child: Container(
              width: 58,
              height: 58,
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _currentIndex == 2
                      ? AppColors.secondary
                      : AppColors.lightSurface.withOpacity(0.6),
                ),
              ),
              child: SvgPicture.asset(
                SpaceXSvgs.rocketLaunchIcon,
                color: _currentIndex == 2
                    ? AppColors.secondary
                    : AppColors.lightSurface.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine the current screen width
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= _tabletBreakpoint) {
      // Use the NavigationRail layout for tablets/desktop
      return Scaffold(
        backgroundColor: Colors.transparent,
        // --- CHANGE 1: ADD APPBAR HERE ---
        appBar: AppBar(
          title: Text(getTranslated(context, 'app_title') ?? 'SpaceX Explorer'),
          backgroundColor: AppColors.darkCardColor,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        // --- CHANGE 2: CALL _buildWideLayout as the body ---
        // The body now correctly sits below the AppBar, making the NavigationRail also start below it.
        body: buildBackgroundBody(context, _buildWideLayout(context)),
      );
    } else {
      // Use the BottomNavigationBar layout for phones
      return _buildCompactLayout(context);
    }
  }
}
