import 'package:flutter/material.dart';
import 'package:mysecretdiary/models/page_diary.dart';
import 'package:mysecretdiary/views/widgets/page_viewer.dart';


class DiaryHomePage extends StatelessWidget {
  const DiaryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageDiary samplePage = PageDiary(
      pageNumber: 1,
      content: '# My First Page\nThis is a sample content with **Markdown**.',
      title: 'My First Page',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Secret Diary'),
      ),
      body: PageViewer(page: samplePage),
    );
  }
}