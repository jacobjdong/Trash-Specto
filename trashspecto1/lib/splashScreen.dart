import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Image foodNoAnything;
  Image foodNoBeef;
  Image foodNoPork;
  Image foodNoBP;
  Image foodNoRestrict;
  @override
  void initState() {
    super.initState();
    foodNoAnything = Image.asset("images/foodlayout1noanything.png");
    foodNoBeef = Image.asset("images/foodlayout1nobeef.png");
    foodNoPork = Image.asset("images/foodlayout1nopork.png");
    foodNoBP = Image.asset("images/foodlayout1nobeeforpork.png");
    foodNoRestrict = Image.asset("images/foodlayout1norestrictions.png");

    Timer(
        Duration(seconds: 0),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MainScreen())));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(foodNoAnything.image, context);
    precacheImage(foodNoBeef.image, context);
    precacheImage(foodNoPork.image, context);
    precacheImage(foodNoBP.image, context);
    precacheImage(foodNoRestrict.image, context);
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitFadingCircle(
      color: Colors.white,
      size: 200.0,
    );
    return Scaffold(
      backgroundColor: Color(0xff5361c2),
      body: Center(child: spinkit),
    );
  }
}