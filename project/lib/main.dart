import 'package:flutter/material.dart';
import 'package:project_ui_intro_screen/utils/colors.dart';
import 'package:project_ui_intro_screen/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical Ui',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 25,
            color: MyColors.titleTextColor,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 18,
            color: MyColors.subTitleTextColor,
            fontWeight: FontWeight.w400,
          ),
          headline3: TextStyle(
            fontSize: 18,
            color: MyColors.titleTextColor,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
