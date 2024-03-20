
import 'package:flutter/material.dart';
import 'package:widcy2/screen/home_screen.dart';
import 'package:widcy2/screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Get Started"),
          onPressed: (){
            final route = MaterialPageRoute(builder: (context) => MainScreen());
            Navigator.of(context).push(route);
          },
        ),
      ),
    );
  }
}