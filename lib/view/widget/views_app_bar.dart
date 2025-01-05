// lib/views/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';

class ViewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ViewsAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}