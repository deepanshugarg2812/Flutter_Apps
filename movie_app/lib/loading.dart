import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};

  Future<Map> getJson() async{
    String url = "http://www.omdbapi.com/?i=tt3896198&apikey=2ff99170";
    Response response = await get(url);
    await setState(() {
      data = json.decode(response.body);
    });
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'Data' : data
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies recommender'),centerTitle: true,),
      body : Container(
      color: Colors.amber,
      child : SpinKitRotatingCircle(
        color: Colors.black,
        size: 50.0,
      )
      ,
    )
    );
  }
}
