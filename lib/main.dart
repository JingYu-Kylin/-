import 'package:flutter/material.dart';
import 'package:xiaoliuren/BotomeMenumPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '小六壬',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.brown,
      ),
      home: BotomeMenumPage(),
    );
  }
}




