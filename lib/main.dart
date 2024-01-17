import 'package:filmplus/homePage.dart';
import 'package:flutter/material.dart';
import 'Widgets/HomeScreen/mainPage.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[850],
        scaffoldBackgroundColor: Colors.grey[850],
        appBarTheme: AppBarTheme(color: Colors.grey[850],),
      ),
      home: HomePage(),
    );
  }
}
