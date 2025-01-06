import 'package:flutter/material.dart';

class PageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isVisible;
  final VoidCallback onPreviewModeButtonPressed;

  const PageAppBar({
    super.key,
    required this.isVisible,
    required this.onPreviewModeButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? AppBar(
      title: const Text('My Secret Diary'),
      actions: [
        IconButton(
          icon: const Icon(Icons.preview),
          onPressed: onPreviewModeButtonPressed,
        ),
      ],
    )
        : const SizedBox.shrink();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}