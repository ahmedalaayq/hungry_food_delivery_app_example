import 'package:flutter/material.dart';
import 'package:hungry/core/widgets/custom_field.dart';
import 'package:hungry/core/widgets/custom_gap.dart';
import 'package:hungry/features/auth/login/views/widgets/password_validity_hint.dart';
import 'package:hungry/theme/app_colors.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Sign up to discover delicious meals delivered to your doorstep.",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          CustomGap(24),
          CustomField(
            controller: _emailController,
            hintText: 'example@gmail.com',
            labelText: 'Email',
          ),
          const SizedBox(height: 16),
          CustomField(
            controller: _passController,
            isPassword: true,
            obscureText: true,
            hintText: '••••••••',
            labelText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),
          CustomField(
            controller: _confirmPassController,
            isPassword: true,
            obscureText: true,
            hintText: '••••••••',
            labelText: 'Confirm Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              final String passField = _passController.text.trim();
              final String confirmPassField = _confirmPassController.text
                  .trim();
              if (passField != confirmPassField) {
                return 'Password not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          PasswordValidityHint(controller: _passController),

          const SizedBox(height: 32),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(56),
              backgroundColor: AppColors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
