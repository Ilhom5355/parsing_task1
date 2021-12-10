import 'package:flutter/material.dart';
import 'package:parsing_task1/pages/detail.page.dart';
import 'package:parsing_task1/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        // DetailPage.id: (context) => DetailPage(),
      },
    );
  }
}
