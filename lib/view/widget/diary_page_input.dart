import 'package:flutter/material.dart';

class DiaryPageInput extends StatelessWidget {
  final TextEditingController controller;

  const DiaryPageInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8.0),
        ),
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }
}