import 'package:flutter/material.dart';
import 'package:jumbo/pages/tips/getStrarted.dart';
import 'package:jumbo/pages/tips/tips.dart';
import 'package:splashscreen/splashscreen.dart';
import './pages/configs.dart';

void main() {
  runApp(MaterialApp(
    home: Splash(),
  ));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new GetStarted(),
        title: new Text(
          'مرحبا بكم في تطبيق مطعمنا',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: primaryColor,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.white);
  }
}
