import 'package:flutter/material.dart';
import 'package:hungry/core/dataSources/local/preference_manager.dart';
import 'package:hungry/features/auth/login/views/login_view.dart';
import 'package:hungry/root.dart';

class SplashController {
  Future<void> excuteLogic(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    if (!context.mounted) return;

    final bool isLoggedIn =
        PreferenceManager.getData<bool>("isLoggedIn") ?? false;

        if(isLoggedIn){
Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Root()),
      );
        }else {
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
        }
    
  }
}
