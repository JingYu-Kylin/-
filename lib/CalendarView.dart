
import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  String _title;

  CalendarView(this._title);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget._title)),
    );
  }
}