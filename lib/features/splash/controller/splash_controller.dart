import 'package:flutter/material.dart';
import 'package:hungry/root.dart';

class SplashController {
  Future<void> excuteLogic(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    if (!context.mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Root()),
    );
  }
}
