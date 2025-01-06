import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:mysecretdiary/view/widget/diary_page_input.dart';
import 'package:mysecretdiary/view/widget/page_app_bar.dart';
import 'package:mysecretdiary/view/widget/notebook_background_painter.dart';

class DiaryPagesView extends StatefulWidget {
  const DiaryPagesView({super.key});

  @override
  DiaryPagesState createState() => DiaryPagesState();
}

class DiaryPagesState extends State<DiaryPagesView> {
  final List<TextEditingController> _controllers = List.generate(
    5, // Number of pages
        (index) => TextEditingController(),
    growable: false,
  );
  bool _isAppBarVisible = true;

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (details.primaryDelta! < 0) {
      // Deslizar hacia arriba
      setState(() {
        _isAppBarVisible = false;
      });
    } else if (details.primaryDelta! > 0) {
      // Deslizar hacia abajo
      setState(() {
        _isAppBarVisible = true;
      });
    }
  }

  void _onPreviewModeButtonPressed() {
    // Aquí se añadirá la lógica para cambiar el modo de previsualización del Markdown
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(
        isVisible: _isAppBarVisible,
        onPreviewModeButtonPressed: _onPreviewModeButtonPressed,
      ),
      body: GestureDetector(
        onVerticalDragUpdate: _onVerticalDragUpdate,
        child: TurnPageView.builder(
          itemCount: _controllers.length,
          useOnTap: false,
          itemBuilder: (context, index) {
            return NotebookPage(
              child: DiaryPageInput(controller: _controllers[index]),
            );
          },
        ),
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