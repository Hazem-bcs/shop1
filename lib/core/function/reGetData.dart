import 'dart:io';

import 'package:flutter/material.dart';

Future<void> retryOperation(BuildContext context, Future<void> Function() operation, ) async {
  try {
    await operation();
  } on SocketException catch (_) {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Try Again..'),
            content: const Text('no internet connection pleas try again'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Bad Connection'),
                onPressed: () {
                  Navigator.of(context).pop();
                  retryOperation(context, operation);
                },
              ),
              ElevatedButton(
                child: const Text('Exit'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  exit(0); // Exit the app
                },
              ),
            ],
          );
        },
      );
    }
  }
}
