// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:cscguru/views/pages/screens/homepage.dart';
import 'package:cscguru/views/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class IntroSplash extends StatefulWidget {
  const IntroSplash({Key key}) : super(key: key);

  @override
  _IntroSplashState createState() => _IntroSplashState();
}

class _IntroSplashState extends State<IntroSplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: CurvedSplashScreen(
          screensLength: splashContent.length,
          screenBuilder: (index) {
            return SplashContent(
              title: splashContent[index]["title"],
              image: splashContent[index]["image"],
              text: splashContent[index]["text"],
            );
          },
          onSkipButton: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          }),
      title: new Text(
        'Welcome To CSCGuru',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
      ),
      gradientBackground: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        // ignore: prefer_const_literals_to_create_immutables
        colors: [
          Color(0xff62cbe5),
          Colors.white,
          Color(0xff62cbe5),
        ],
      ),
      image: new Image.asset(
        "assets/logowithtext.png",
        color: Color(0xff62cbe5),
        fit: BoxFit.cover,
      ),
      useLoader: true,
      backgroundColor: Colors.white70,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loadingText: Text(
        "Designed & Developed By Zaid Bashir @ ProgrammerRockers ©️ 2022",
        style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            decoration: TextDecoration.none),
      ),
      loaderColor: Color(0xff62cbe5),
    );
  }
}

class SplashContent extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const SplashContent({
    Key key,
    @required this.title,
    @required this.text,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          // ignore: sized_box_for_whitespace
          Container(
            height: 200,
            child: Image.asset(image),
          ),
          SizedBox(height: 60),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 19,
            ),
          )
        ],
      ),
    );
  }
}

final splashContent = [
  {
    "title": "Start Learning",
    "text":
        "Start learning now by using this app, Get your choosen course and start the journey.",
    "image": "assets/1.png",
  },
  {
    "title": "Explore Courses",
    "text": "Choose which course is suitable for you to enroll in.",
    "image": "assets/2.png",
  },
  {
    "title": "At Any time.",
    "text": "Your courses is available at any time you want. Join us now !",
    "image": "assets/3.png"
  },
];
