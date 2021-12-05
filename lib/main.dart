import 'package:flutter/material.dart';
import 'package:flutter_application_1/bus_lines.view.dart';
import 'package:flutter_application_1/bus_location_view.dart';
import 'package:flutter_application_1/bus_map.dart';

// ignore: prefer_const_constructors
void main() => runApp(MyApp());
//AIzaSyBcss692ynwzSL59XbE5PAs1oMYhAYUjPc
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home:BusLineView() ,
    );
  }
}
