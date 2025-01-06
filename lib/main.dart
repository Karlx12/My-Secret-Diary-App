import 'package:flutter/material.dart';
import 'package:mysecretdiary/view/diary_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Secret Diary',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: DiaryHomePage(),
    );
  }
}