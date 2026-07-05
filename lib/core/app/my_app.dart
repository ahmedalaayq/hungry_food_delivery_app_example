import 'package:flutter/material.dart';
import 'package:hungry/features/auth/signup/views/signup_view.dart';
import 'package:hungry/features/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungry',
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFFFFFFF)),
    );
  }
}
