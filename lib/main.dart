import 'package:flutter/material.dart';
import 'package:image_gallery/module/splash_screen/splash_screen.dart';

import 'module/home_screen/home_screen.dart';
final ValueNotifier<bool> isPortrait = ValueNotifier<bool>(true);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen()
    );
  }
}


