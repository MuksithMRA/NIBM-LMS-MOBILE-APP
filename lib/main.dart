import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';


import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NIBM LMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 500,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 165,
                child: Image.asset("assets/splashImg.png")),
            const Text(
              "NIBM LIBRARY MANAGEMENT\nSYSTEM",
              textAlign: TextAlign.center,
            )
          ],
        ),
        nextScreen: const Home(),
      ),
    );
  }
}
