import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'stats_screen.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final List _screens = [
    Home_Screen(),
    StatsScreen(),
    Scaffold(),
    Scaffold()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home,Icons.insert_chart,Icons.event_note,Icons.info]
            .asMap()
            .map((key, value) => MapEntry(key,BottomNavigationBarItem(
          title: Text(''),
          icon : Container(
            padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 16.0),
            decoration: BoxDecoration(color: _currentIndex==key?Colors.blue:Colors.transparent,borderRadius: BorderRadius.circular(10.0)),
            child: Icon(value),
          ),
        )
        )).values.toList(),
      ),
    );
  }
}
