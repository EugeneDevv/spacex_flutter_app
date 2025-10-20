// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spacex_flutter_app/core/utils/colors.dart';
import 'package:spacex_flutter_app/domain/entities/app_assets.dart';
import 'package:spacex_flutter_app/presentation/screens/land_pad_list_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/launch_list_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/capsule_list_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/mission_list_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/rocket_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;

  // The list of pages corresponding to the bottom nav items
  final List<Widget> _pages = [
    const CapsulesListScreen(),
    // SizedBox(),
    const RocketListScreen(),
    // Launch list screen
    const LaunchListScreen(),
    const MissionListScreen(),
    const LandPadListScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack is key for state preservation.
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.darkCardColor, // Dark background
        selectedItemColor: AppColors.secondary, // Vibrant accent color
        unselectedItemColor: Theme.of(context)
            .colorScheme
            .onPrimary
            .withOpacity(0.6), // Muted primary color
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          color: AppColors.secondary,
        ),
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          bottomNavItem(
              assetSvgPath: SpaceXSvgs.rocketLaunchPadIcon,
              labelText: 'Capsules'),
          bottomNavItem(
              assetSvgPath: SpaceXSvgs.rocketIcon, labelText: 'Rockets'),
          bottomNavItem(assetSvgPath: '', labelText: ''),
          bottomNavItem(
              assetSvgPath: SpaceXSvgs.missionIcon, labelText: 'Missions'),
          bottomNavItem(
              assetSvgPath: SpaceXSvgs.landingPadIcon, labelText: 'Land Pads'),
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
}

BottomNavigationBarItem bottomNavItem({
  required String assetSvgPath,
  required String labelText,
}) {
  return BottomNavigationBarItem(
    icon: assetSvgPath.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: SvgPicture.asset(
              assetSvgPath,
              color: AppColors.lightSurface.withOpacity(0.6),
            ),
          )
        : const SizedBox(),
    label: labelText,
    activeIcon: assetSvgPath.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: SvgPicture.asset(assetSvgPath, color: AppColors.secondary),
          )
        : const SizedBox(),
  );
}
