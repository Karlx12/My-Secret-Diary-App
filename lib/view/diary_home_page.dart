import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:mysecretdiary/view/widget/diary_page_input.dart';

class DiaryPagesView extends StatefulWidget {
  const DiaryPagesView({super.key});

  @override
  DiaryPagesState createState() => DiaryPagesState();
}

class DiaryPagesState extends State<DiaryPagesView> {
  final List<TextEditingController> _controllers = List.generate(
    5, // Number of pages
        (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Secret Diary'),
      ),
      body: TurnPageView.builder(
        itemCount: _controllers.length,
        itemBuilder: (context, index) {
          return DiaryPageInput(controller: _controllers[index]);
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}