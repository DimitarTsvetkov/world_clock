import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/Europe/Sofia');

    print(response.body);

    // get prop from data

    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    // print(datetime);
    print(offset);

    //create datetime obj

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  int counter = 0;

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('loading screen'));
  }
}
