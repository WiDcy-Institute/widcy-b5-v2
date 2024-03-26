
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:widcy2/screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    final route = MaterialPageRoute(builder: (context) =>  MainScreen());
    Timer(Duration(seconds: 2), () => Navigator.pushReplacement(context, route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: logoWidget,
    );
  }

  Widget get logoWidget {
    return Center(
      child: Image.asset("assets/img/widcy_logo.jpg", height: 100, width: 100,),
    );
  }

}