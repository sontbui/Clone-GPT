import 'package:flutter/material.dart';

void showSnackbar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
