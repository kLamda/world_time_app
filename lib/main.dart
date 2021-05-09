import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/location.dart';
import 'package:world_time_app/pages/error.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/location": (context) => Location(),
      // '/location-load' : (context) => LoadingLocation(),
      "/error" : (context) => Error(),
      '/update' : (context) => UpdateTime()
    },
  ));
}
