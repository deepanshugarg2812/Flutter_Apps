import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {
    'title' : "Hello"
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    data = data['Data'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: new Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: new Text(
          'Movies',
          style: new TextStyle(color: Colors.black,fontFamily: 'Arvo',fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          new Icon(
            Icons.menu,
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Top Rated',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Card(
              child: Column(
                children: [
                  Text(data['Title']),
                  SizedBox(height: 5.0,),
                  Image.network(data['Poster']),
                  SizedBox(height: 5.0,),
                  FlatButton(onPressed: () => Navigator.pushNamed(context, '/details',arguments: {'Data' : data}), child: Text('Check Details'),color: Colors.blue,)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
