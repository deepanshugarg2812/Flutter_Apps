import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: SafeArea(
      child : Padding(
        padding: EdgeInsets.all(120.0),
      child : Column(
        children: [
          FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/choose_loc');
                },
              icon: Icon(Icons.edit_location),
              label: Text('Choose Location'),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data['location'],
                style: TextStyle(
                  fontSize: 30.0
                )
              ),
              SizedBox(height: 10.0,),
              Text(
                data['time'],
                  style: TextStyle(
                      fontSize: 40.0
                  )
              )
            ],
          )
        ],
      )
      )),
    );
  }
}
