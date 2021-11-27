import 'package:flutter/material.dart';
import 'package:flutter_application_1/week1/welcome/weclome_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: WelcomeView(),
      ),
    );
  }
}