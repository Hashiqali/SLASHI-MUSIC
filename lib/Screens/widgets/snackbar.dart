import 'package:flutter/material.dart';

snackbar(text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color.fromARGB(255, 31, 30, 30),
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.orange.shade700, fontFamily: 'SLASHI'),
    ),
  ));
}
