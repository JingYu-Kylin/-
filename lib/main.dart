import 'package:flutter/material.dart';
import 'package:xiaoliuren/BotomeMenumPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //设置app名称
      title: '小六壬',
      debugShowCheckedModeBanner: false,
      //设置默认主题
      theme: ThemeData(
          primarySwatch: Colors.brown,
      ),
      home: BotomeMenumPage(),
    );
  }
}




