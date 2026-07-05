import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/assetsManager/assets_manager.dart';
import 'package:hungry/core/widgets/custom_gap.dart';
import 'package:hungry/features/auth/login/views/widgets/login_form.dart';
import 'package:hungry/theme/app_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 24,
            children: [
              Center(child: SvgPicture.asset(AssetsManager.hungry, height: 50)),

              const CustomGap(10),

              /// LoginForm 
              LoginForm(formKey: _formKey),
              
            ],
          ),
        ),
      ),
    );
  }
}
