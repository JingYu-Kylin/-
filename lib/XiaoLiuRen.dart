import 'package:flutter/material.dart';

class XiaoLiuRenView extends StatefulWidget {
  String _title;

  XiaoLiuRenView(this._title);

  @override
  _XiaoLiuRenViewState createState() => _XiaoLiuRenViewState();
}

class _XiaoLiuRenViewState extends State<XiaoLiuRenView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text("123"),
          ),
          Container(
            child: Text("456"),
          )
        ],
      )
    );
  }
}