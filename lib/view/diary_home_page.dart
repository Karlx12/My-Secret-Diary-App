import 'package:flutter/material.dart';
import 'package:mysecretdiary/view/diary_pages_view.dart';

class DiaryHomePage extends StatelessWidget {
  const DiaryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DiaryPagesView(),
    );
  }
}