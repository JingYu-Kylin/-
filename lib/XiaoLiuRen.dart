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
      child: Center(child: Text(widget._title)),
    );
  }
}