// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageList = [
    "assets/c_programming.jpg",
    "assets/cpp_programming.jpg",
    "assets/operating_system.png",
    "assets/digital_electronics.jpg",
    "assets/data_structures.png",
    "assets/algorithms.png",
    "assets/java_programming.png",
    "assets/computer_architecture.jpg",
    "assets/php.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("CSC Guru"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            GFListTile(
              avatar: GFAvatar(
                size: 50,
                backgroundImage: AssetImage("assets/developer.jpg"),
              ),
              titleText: 'Welcome To CSC Guru',
              subTitleText: 'Lets Explore the World of Computer Science',
            ),
            GFCarousel(
              autoPlay: true,
              activeIndicator: Colors.green,
              autoPlayAnimationDuration: Duration(seconds: 1),
              items: imageList.map(
                (url) {
                  return Card(
                    borderOnForeground: true,
                    elevation: 20,
                    shadowColor: Colors.red,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child:
                            Image.asset(url, fit: BoxFit.cover, width: 1000.0),
                      ),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                debugPrint(index.toString());
                setState(() {
                  index;
                });
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Explore...",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: GFButton(
                    onPressed: () {},
                    color: Colors.orange,
                    text: "Syllbus",
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                    type: GFButtonType.solid,
                    blockButton: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: GFButton(
                    onPressed: () {},
                    color: Colors.blue,
                    text: "Videos",
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                    type: GFButtonType.solid,
                    blockButton: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: GFButton(
                    onPressed: () {},
                    color: Colors.green,
                    text: "Notes",
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                    type: GFButtonType.solid,
                    blockButton: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: GFButton(
                    onPressed: () {},
                    color: Colors.teal,
                    text: "Quizes",
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                    type: GFButtonType.solid,
                    blockButton: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: GFButton(
                    onPressed: () {},
                    color: Colors.pink,
                    text: "Coding",
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                    type: GFButtonType.solid,
                    blockButton: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: GFButton(
                    color: Colors.brown,
                    onPressed: () {},
                    text: "MCQ's",
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                    type: GFButtonType.solid,
                    blockButton: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
