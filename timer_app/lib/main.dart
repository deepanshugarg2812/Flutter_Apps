import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:node_interop/timers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home : Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double percentage = 0;
  static int timeInMin = 25;
  int timeInSec = timeInMin * 60;
  Timer timer;
  void _startTimer(){
    timeInMin = 25;
    int time = timeInMin*60;
    double secPercnt = (time/100);
    timer = Timer.periodic(Duration(seconds : 1), (timer) {
      setState(() {
        if(time>0){
          time--;
          if(time%60 == 0){
            timeInMin--;
          }
          if(time  %secPercnt == 0){
            if(percentage<1){
              percentage += 0.1;
            }
            else{
              percentage += 1;
            }
          }
        }
        else{
          timeInMin = 25;
          timeInSec = timeInMin*60;
          percentage = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1542bf),Color(0xff51a8ff)],
              begin: FractionalOffset(0.5,1)
            )
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Timer App',style : TextStyle(
                color: Colors.white,
                fontSize: 40.0
              )),
              SizedBox(height: 25.0,),
              Expanded(
                  child: CircularPercentIndicator(
                    percent: percentage,
                    animateFromLastPercent: true,
                    animation: true,
                    radius: 250.0,
                    lineWidth: 20.0,
                    progressColor: Colors.white,
                    center: Text("$timeInMin",style: TextStyle(fontSize: 80.0),),
                  ),
              ),
              SizedBox(height: 10.0,),
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0))
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top:30,left: 20,right: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child : Column(
                                  children : [
                                  Text('Study time',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5.0,),
                                    Text("25",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)
                                ],
                              )
                              ),
                              Expanded(
                                  child : Column(
                                    children : [
                                      Text('Pause time',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 5.0,),
                                      Text("5",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 50.0,),
                          RaisedButton(
                            onPressed: _startTimer,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text('Start timer',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

