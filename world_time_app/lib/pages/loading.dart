import 'package:flutter/material.dart';
import 'world_class.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time_now = 'Loading';

  void getAsyncData() async{
    WorldClass WC = WorldClass('Europe','Europe.png','Europe/London');
    await WC.getData();
    Navigator.pushReplacementNamed(context,'/home',arguments : {
      'time' : WC.time,
      'location' : WC.location,
      'url' : WC.url,
      'flag' : WC.flag
    });
  }

  @override
  void initState() {
    super.initState();
    getAsyncData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[1000],
      body : Center(
        child: SpinKitRotatingCircle(
        color: Colors.black,
        size: 50.0,
      ),
    )
    );
  }
}
