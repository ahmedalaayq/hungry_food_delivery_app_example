import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/assetsManager/assets_manager.dart';
import 'package:hungry/core/widgets/custom_gap.dart';
import 'package:hungry/features/auth/signup/views/widgets/signup_form.dart';
import 'package:hungry/theme/app_colors.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: .center,
                spacing: 24,
                children: [
                  SvgPicture.asset(AssetsManager.hungry, height: 50),
                  CustomGap(20),

                  /// SignUpForm
                  SignUpForm(formKey: _formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
