import 'package:flutter/material.dart';
import 'package:lunar_calendar_converter/lunar_solar_converter.dart';
//import "package:json_serializable/json_serializable.dart";

class XiaoLiuRenView extends StatefulWidget {
  String _title;
  XiaoLiuRenView(this._title);
  @override
  _XiaoLiuRenViewState createState() => _XiaoLiuRenViewState();
}

class _XiaoLiuRenViewState extends State<XiaoLiuRenView> {
  String get _title => "诸葛武侯马前课";
  String hexagram;
  Conversion conversion;

  @override
  void initState() {
    conversion = new Conversion();
    hexagram = "";
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(this._title, style: const TextStyle(fontFamily: "LiShu"),),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Image.asset(
              'assets/images/top.png',
              fit: BoxFit.fill,
            ),
            new MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text('卜卦'),
                onPressed: () {
                  String result = conversion.conversion();
                  setState(() {
                    hexagram = result;
                  });
                },
            ),
            new Text("卦辞: ${hexagram.toString()}"),
          ],
        ),
      ),
    );
  }
}

class Conversion {
  String conversion() {
    var date = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch);
    //当前时间
    if (date.hour >= 23) {
      date = date.add(new Duration(days: 1));
    }
    //转换成农历
    Solar solar = Solar(solarYear: date.year, solarMonth: date.month, solarDay: date.day);
    Lunar lunar = LunarSolarConverter.solarToLunar(solar);
    int hours = getHours(date.hour);
    int dayRemainder = (lunar.lunarMonth + lunar.lunarDay - 1) % 6;
    if (dayRemainder == 0) {
      dayRemainder = 6;
    }
    int hourRemainder = (dayRemainder + hours - 1) % 6;
    if (hourRemainder == 0) {
      hourRemainder = 6;
    }
    String dayResult = divination(dayRemainder);
    String hourResult = divination(hourRemainder);
    String hexagram = getHexagram(dayResult, hourResult);

    return hexagram;
  }

  int getHours(int hour) {
    int hours;
    if (hour >=23 || hour < 1) {
      hours = 1;
    } else if (hour >= 1 && hour < 3) {
      hours = 2;
    } else if (hour >= 3 && hour < 5) {
      hours = 3;
    } else if (hour >= 5 && hour < 7) {
      hours = 4;
    } else if (hour >= 7 && hour < 9) {
      hours = 5;
    } else if (hour >= 9 && hour < 11) {
      hours = 6;
    } else if (hour >= 11 && hour < 13) {
      hours = 7;
    } else if (hour >= 13 && hour < 15) {
      hours = 8;
    } else if (hour >= 15 && hour < 17) {
      hours = 9;
    } else if (hour >= 17 && hour < 19) {
      hours = 10;
    } else if (hour >= 19 && hour < 21) {
      hours = 11;
    } else if (hour >= 21 && hour < 23) {
      hours = 12;
    }
    return hours;
  }
  String divination (int remainder) {
    String result;
    switch (remainder) {
      case 1:
        result = "大安";
        break;
      case 2:
        result = "留连";
        break;
      case 3:
        result = "速喜";
        break;
      case 4:
        result = "赤口";
        break;
      case 5:
        result = "小吉";
        break;
      case 6:
        result = "空亡";
        break;
      default:
        result = "error";
        break;
    }
    return result;
  }
  String getHexagram(String dayResult, String hourResult) {
    String hexagram;
    switch (dayResult) {
      case "大安":
        switch (hourResult) {
          case "大安":
            hexagram = "大安事事昌，求财在坤方，失物去不远，宅舍保安康，人身未动，病者主无妨，将军回田野，仔细更推详";
            break;
          case "留连":
            hexagram = "大安加留连，办事不周全，失物西北去，婚姻晚几天。";
            break;
          case "速喜":
            hexagram = "大安加速喜，事事自己起，失物当日见，婚姻自己提。";
            break;
          case "赤口":
            hexagram = "大安加赤口，办事不顺手，失物不用找，婚姻两分手。";
            break;
          case "小吉":
            hexagram = "大安加小吉，事事从己及，失物不出门，婚姻成就地。";
            break;
          case "空亡":
            hexagram = "大安加空亡，病人要上床，失物无踪影，事事不顺情。";
            break;
          case "error":
            hexagram = "";
            break;
        }
        break;
      case "留连":
        switch (hourResult) {
          case "大安":
            hexagram = "留连加大安，办事两分张，婚姻有喜事，先苦后来甜。";
            break;
          case "留连":
            hexagram = "留连事难成，求谋日未明，官事凡宜缓，去者未回程，失物南方见，急讨方心称，更须防口舌，人口且平平。";
            break;
          case "速喜":
            hexagram = "留连加速喜，事事由自己，婚姻有成意，失物三天里。";
            break;
          case "赤口":
            hexagram = "留连加赤口，病者死人口，失物准丢失，婚姻两分手。";
            break;
          case "小吉":
            hexagram = "留连加小吉，事事不用提，失物东南去，病者出人齐。";
            break;
          case "空亡":
            hexagram = "留连加空亡，病人准死亡，失物不见面，婚姻两分张。";
            break;
          case "error":
            hexagram = "";
            break;
        }
        break;
      case "速喜":
        switch (hourResult) {
          case "大安":
            hexagram = "速喜加大安，事事都平安，姻姻成全了，占病都相安。";
            break;
          case "留连":
            hexagram = "速喜加留连，婚姻不可言，失物无信息，病人有仙缘。";
            break;
          case "速喜":
            hexagram = "速喜喜来临，求财向南行，失物申未午，逢人路上寻，官事有福德，病者无祸侵，田宅六畜吉，行人有信音。";
            break;
          case "赤口":
            hexagram = "速喜加赤口，自己往外走，失物往正北，婚姻得勤走。";
            break;
          case "小吉":
            hexagram = "速喜加小吉，婚姻有人提，病人当天好，时物在家里。";
            break;
          case "空亡":
            hexagram = "速喜加空亡，婚姻有分张，病者积极治，失物不久见。";
            break;
          case "error":
            hexagram = "";
            break;
        }
        break;
      case "赤口":
        switch (hourResult) {
          case "大安":
            hexagram = "赤口加大安，办事险和难，失物东北找，婚姻指定难。";
            break;
          case "留连":
            hexagram = "赤口加留连，办事有困难，行人在外走，失物不回还。";
            break;
          case "速喜":
            hexagram = "赤口加速喜，婚姻在自己，失物有着落，办事官事起。";
            break;
          case "赤口":
            hexagram = "赤口主口舌，官非切宜防，失物速速讨，行人有惊慌，六畜多作怪，病者出西方，更须防咀咒，诚恐染瘟皇。";
            break;
          case "小吉":
            hexagram = "赤口加小吉，办事自己提，婚姻不能成，失物无信息。";
            break;
          case "空亡":
            hexagram = "赤口加空亡，无病也上床，失物不用找，婚姻不能成。";
            break;
          case "error":
            hexagram = "";
            break;
        }
        break;
      case "小吉":
        switch (hourResult) {
          case "大安":
            hexagram = "小吉加大安，事事两周全，婚姻当日定，失物自己损。";
            break;
          case "留连":
            hexagram = "小吉加留连，事事有反还，婚姻有人破，失物上西南。";
            break;
          case "速喜":
            hexagram = "小吉加速喜，事事从头起，婚姻能成就，失物在院里。";
            break;
          case "赤口":
            hexagram = "小吉加赤口，办事往外走，婚姻有难处，失物丢了手。";
            break;
          case "小吉":
            hexagram = "小吉最吉昌，路上好商量，阴人来报喜，失物在坤方，行人即便至，交关甚是强，凡事皆和合，病者叩穷苍";
            break;
          case "空亡":
            hexagram = "小吉加空亡，病人不妥当，失物正东找，婚姻再想想。";
            break;
          case "error":
            hexagram = "";
            break;
        }
        break;
      case "空亡":
        switch (hourResult) {
          case "大安":
            hexagram = "空亡加大安，事事不周全，婚姻从和好，失物反复间。";
            break;
          case "留连":
            hexagram = "空亡加留连，办事处处难，婚姻重新定，失物永不还。";
            break;
          case "速喜":
            hexagram = "空亡加速喜，事事怨自己，婚姻有一定，失物在家里。";
            break;
          case "赤口":
            hexagram = "空亡加赤口，办事官非有，婚姻难定准，失物往远走。";
            break;
          case "小吉":
            hexagram = "空亡加小吉，事事有猜疑，婚姻有喜事，失物回家里。";
            break;
          case "空亡":
            hexagram = "空亡事不祥，阴人多乖张，求财无利益，行人有灾殃，失物寻一见，官事有刑伤，病人逢暗鬼，解禳保安康。";
            break;
          case "error":
            hexagram = "";
            break;
        }
        break;
      case "error":
    }
    return hexagram;
  }
}