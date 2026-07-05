import 'package:flutter/material.dart';
import 'package:hungry/features/splash/controller/splash_controller.dart';
import 'package:hungry/features/splash/views/widgets/splash_view_body.dart';
import 'package:hungry/theme/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SplashController().excuteLogic(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.primary, body: SplashViewBody());
  }
}
