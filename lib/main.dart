

import 'package:flutter/material.dart';
import 'package:world_time_api/pages/home.dart';
import 'package:world_time_api/pages/loading.dart';
import 'package:world_time_api/pages/location.dart';

void main() {
  runApp(MaterialApp(

    //routes
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' :(context) => Location()
    },
  ));
}

