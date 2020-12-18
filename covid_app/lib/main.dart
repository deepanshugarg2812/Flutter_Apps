import 'package:flutter/material.dart';
import 'package:covid_app/screens/loading.dart';
import 'package:covid_app/screens/home_screen.dart';
import 'package:covid_app/screens/details_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Covid App',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
    },
  ));
}