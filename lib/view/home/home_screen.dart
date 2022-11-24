import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/view/account/account_screen.dart';
import 'package:fdriver/view/now/now_screen.dart';
import 'package:fdriver/view/ordercalendar/order_calendar.dart';
import 'package:fdriver/view/statistical/statistical_screen.dart';
import 'package:fdriver/view/takeorder/take_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(selectedIndex: selectedIndex.obs);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({required this.selectedIndex});
  var _homeController = Get.find<HomeController>();
  var selectedIndex = 0.obs;

  @override
  void initState() {
    _homeController.getIdDriver();
    super.initState();
  }

  @override
  void dispose() {
    _homeController.disposeHome.value = true;
    super.dispose();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    AccountScreen(),
    NowScreen(),
    TakeOrderScreen(),
    OrderCalendarScreen(),
    StatisticalScreen(),
  ];

  void _onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => _homeController.disposeHome.value == false
            ? _widgetOptions.elementAt(selectedIndex.value)
            : Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
              )),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Theme.of(context).primaryColor.withOpacity(0.5),
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
        child: Obx(() => NavigationBar(
              animationDuration: const Duration(milliseconds: 300),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              height: 60,
              selectedIndex: selectedIndex.value,
              onDestinationSelected: _onItemTapped,
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.account_box_outlined),
                    selectedIcon: Icon(Icons.account_box),
                    label: 'Account'),
                NavigationDestination(
                    icon: Icon(Icons.toys_outlined),
                    selectedIcon: Icon(Icons.toys),
                    label: 'Now'),
                NavigationDestination(
                    icon: Icon(Icons.assignment_outlined),
                    selectedIcon: Icon(Icons.assignment_sharp),
                    label: 'Take order'),
                NavigationDestination(
                    icon: Icon(Icons.calendar_month_outlined),
                    selectedIcon: Icon(Icons.calendar_month),
                    label: 'Calendar'),
                NavigationDestination(
                    icon: Icon(Icons.checklist_outlined),
                    selectedIcon: Icon(Icons.checklist),
                    label: 'Statistical'),
              ],
            )),
      ),
    );
  }
}
