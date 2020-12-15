import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MaterialApp(
    home : Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('This is my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text('1'),
              color: Colors.amber,
              padding: EdgeInsets.all(30),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text('2'),
              color: Colors.cyanAccent,
              padding: EdgeInsets.all(30),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text('3'),
              color: Colors.black12,
              padding: EdgeInsets.all(30),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Click'),
      ),
    );
  }
}

String ClickMe(){
  print('You clicked');
}