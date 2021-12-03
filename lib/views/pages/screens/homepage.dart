// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        // leading: GFIconButton(
        //   icon: Icon(
        //     Icons.message,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {},
        //   type: GFButtonType.transparent,
        // ),
        title: Text("CSC Guru"),
        // actions: <Widget>[
        //   GFIconButton(
        //     icon: Icon(
        //       Icons.favorite,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {},
        //     type: GFButtonType.transparent,
        //   ),
        // ],
      ),
      body: Container(),
    );
  }
}
