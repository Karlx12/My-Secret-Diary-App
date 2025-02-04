import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../models/page_diary.dart';

class PageViewer extends StatelessWidget {
  final PageDiary page;

  const PageViewer({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Markdown(
        data: page.content,
        styleSheet: MarkdownStyleSheet(
          textAlign: WrapAlignment.start,
        ),
      ),
    );
  }
}