import 'package:flutter/material.dart';

customDialog(BuildContext context, String title, String message) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
        );
      });
}
