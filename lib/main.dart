import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widcy2/screen/splash_screen.dart';
import 'package:widcy2/util/LanguageProvider.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    final splashScreen = SplashScreen();

    final provider = MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_) =>  LanguageProvider())
      ],
      child: MaterialApp(
        title: 'WIDCY',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            primarySwatch: Colors.blue
        ),
        home: splashScreen,
      ),
    );

    return provider;
  }
}
