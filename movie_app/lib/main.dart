import 'package:flutter/material.dart';
import 'package:movie_app/movie_list.dart';
import 'movie_detail.dart';
import 'loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/details' : (context) => MovieDetails()
    },
    title: "Movie recommender",
  ));
}