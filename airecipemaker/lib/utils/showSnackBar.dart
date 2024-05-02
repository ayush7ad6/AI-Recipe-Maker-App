import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green.shade800,
      content: Center(child: Text(text)),
    ),
  );
}

void showSnackBarDanger(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red.shade800,
      content: Center(child: Text(text)),
    ),
  );
}
