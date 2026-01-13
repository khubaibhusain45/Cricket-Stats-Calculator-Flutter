import 'package:flutter/material.dart';

Future<bool> showExitDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text("Exit App"),
      content: Text("Do you really want to exit the app?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text("No"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text("Yes"),
        ),
      ],
    ),
  ) ??
      false;
}
