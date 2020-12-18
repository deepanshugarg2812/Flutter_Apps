import 'package:flutter/material.dart';
import 'details_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  final List _screen = [
    DetailsScreen(),
    DetailsScreen(),
    DetailsScreen(),
    DetailsScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home,Icons.insert_chart,Icons.event_note,Icons.info].asMap().map((key, value) => MapEntry(key,
            BottomNavigationBarItem(
          title: Text(''),
          icon: Container(
            padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 16.0),
            decoration: BoxDecoration(
              color: _currentIndex==key?Colors.blue[600]:Colors.transparent,
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Icon(value),
          )
        )
        )
        ).values.toList()

      ),
    );
  }
}
