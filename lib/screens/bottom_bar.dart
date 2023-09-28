import 'package:bmi_app/tabs/chart.dart';
import 'package:bmi_app/tabs/settings.dart';
import 'package:flutter/material.dart';

import '../assets.dart';
import '../tabs/dashboard.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});
  static const String routeName = '/bottom';

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Widget> _pages = [
    const DashboardTab(),
    ChartTab(),
    const SettingsTab(),
  ];

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundcolor = Colors.white;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: backgroundcolor,
            icon: Image.asset(
              Asset.dashBoard,
              width: 30,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: backgroundcolor,
            icon: Image.asset(
              Asset.chart,
              width: 30,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: backgroundcolor,
            icon: Image.asset(
              Asset.setting,
              width: 30,
              height: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
