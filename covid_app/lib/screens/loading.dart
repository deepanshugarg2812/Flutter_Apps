import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};

  Future<void> getJsonData() async{
    Response response = await get("https://api.covid19api.com/summary");
    data = json.decode(response.body);
    // print(data);
    Navigator.pushReplacementNamed(context,'/home',arguments: {'Data' : data});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid App'),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [Colors.green, Colors.blue]
            )
          ),
          child: Center(
              child : SpinKitRotatingCircle(
                color: Colors.white,
                size: 50.0,
          )
          ),
        )
    );
  }
}
