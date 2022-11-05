import 'package:fdriver/view/account/account_screen.dart';
import 'package:fdriver/view/now/now_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex = 0.obs;

  static const List<Widget> _widgetOptions = <Widget>[
    AccountScreen(),
    Text('1', style: TextStyle(fontSize: 24)),
    Text('2', style: TextStyle(fontSize: 24)),
    Text('3', style: TextStyle(fontSize: 24)),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: _widgetOptions.elementAt(_selectedIndex.value),
          ),
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                indicatorColor: Theme.of(context).primaryColor.withOpacity(0.5),
                labelTextStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold))),
            child: NavigationBar(
              animationDuration: const Duration(milliseconds: 300),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              height: 60,
              selectedIndex: _selectedIndex.value,
              onDestinationSelected: _onItemTapped,
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.account_box_outlined),
                    selectedIcon: Icon(Icons.account_box),
                    label: 'account'),
                NavigationDestination(
                    icon: Icon(Icons.toys_outlined),
                    selectedIcon: Icon(Icons.toys),
                    label: 'Now'),
                NavigationDestination(
                    icon: Icon(Icons.calendar_month_outlined),
                    selectedIcon: Icon(Icons.calendar_month),
                    label: 'booked'),
                NavigationDestination(
                    icon: Icon(Icons.checklist_outlined),
                    selectedIcon: Icon(Icons.checklist),
                    label: 'history'),
              ],
            ),
          ),
        ));
  }
}
