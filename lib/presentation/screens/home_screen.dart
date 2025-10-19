import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/screens/land_pad_list_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/launch_list_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/launch_pad_list_screen.dart';
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
    const LaunchPadListScreen(),
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
        backgroundColor: Colors.black, // Dark background
        selectedItemColor: Colors.blueAccent, // Vibrant accent color
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // Necessary for 5 items
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.flight_land),
            label: 'Launch Pads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: 'Rockets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch),
            label: 'Launches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Missions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            label: 'Land Pads',
          ),
        ],
      ),
    );
  }
}
