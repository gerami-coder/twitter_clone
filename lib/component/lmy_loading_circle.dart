import 'package:flutter/material.dart';
import 'dart:async';

void showLoadingCircle(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing by tapping outside
    builder: (context) {
      // Create a timer to automatically dismiss the dialog after 3 seconds
      Timer(const Duration(seconds: 3), () => Navigator.pop(context));

      return const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(child: CircularProgressIndicator()),
      );
    },
  );
}

void hideLoadingCircle(BuildContext context) {
  Navigator.pop(context);
}
