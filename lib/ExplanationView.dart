
import 'package:flutter/material.dart';

class ExplanationView extends StatefulWidget {
  String _title;
  ExplanationView(this._title);
  @override
  _ExplanationViewState createState() => _ExplanationViewState();
}

class _ExplanationViewState extends State<ExplanationView> {
  @override
  void initState() {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(widget._title, style: const TextStyle(fontFamily: "LiShu"),),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            ),
          ],
        ),
      ),
    );
  }

}