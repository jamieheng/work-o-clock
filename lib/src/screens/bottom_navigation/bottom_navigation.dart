import 'package:flutter/material.dart';
import 'package:work_o_clock/src/screens/chat_screen/chat_list.dart';
import 'package:work_o_clock/src/screens/events_screen/events_screen.dart';
import 'package:work_o_clock/src/screens/home_screen/home_screen.dart';
import 'package:work_o_clock/src/screens/payment/payroll_screen.dart';
import 'package:work_o_clock/src/screens/profile_screen/profile_screen.dart';
import 'package:work_o_clock/src/utils/base_colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  // List of widgets to display in each tab
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const EventsScreen(),
    const PayrollScreen(),
    const ChatListScreen(),
    const ProfileScreen(),
  ];

  // Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payroll',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: BaseColors.primaryColor,
      ),
    );
  }
}
