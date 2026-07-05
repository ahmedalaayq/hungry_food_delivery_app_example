import 'package:flutter/material.dart';
import 'package:hungry/theme/app_colors.dart';

class PasswordValidityHint extends StatelessWidget {
  const PasswordValidityHint({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final password = value.text;
        if (password.isEmpty) {
          return const SizedBox.shrink();
        }

        final rules = <_PasswordRule>[
          _PasswordRule(
            label: isArabic ? '٨ أحرف على الأقل' : 'At least 8 characters',
            isValid: password.length >= 8,
          ),
          _PasswordRule(
            label: isArabic ? 'حرف كبير وصغير' : 'Upper and lower case',
            isValid:
                RegExp(r'[A-Z]').hasMatch(password) &&
                RegExp(r'[a-z]').hasMatch(password),
          ),
          _PasswordRule(
            label: isArabic ? 'رقم واحد على الأقل' : 'At least one number',
            isValid: RegExp(r'\d').hasMatch(password),
          ),
        ];
        final validCount = rules.where((rule) => rule.isValid).length;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFBF8F2),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFECE3D3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    validCount == rules.length
                        ? Icons.verified_rounded
                        : Icons.shield_outlined,
                    color: validCount == rules.length
                        ? AppColors.primary
                        : const Color(0xFF9A836D),
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      isArabic ? 'قوة كلمة المرور' : 'Password strength',
                      style: TextStyle(
                      
                        fontSize: 12.5,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Text(
                    '$validCount/${rules.length}',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF9A836D),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final rule in rules) _PasswordRuleChip(rule: rule),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PasswordRule {
  const _PasswordRule({required this.label, required this.isValid});

  final String label;
  final bool isValid;
}

class _PasswordRuleChip extends StatelessWidget {
  const _PasswordRuleChip({required this.rule});

  final _PasswordRule rule;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: rule.isValid
            ? AppColors.primary.withValues(alpha: 0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: rule.isValid
              ? AppColors.primary.withValues(alpha: 0.24)
              : const Color(0xFFE8DDCA),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            rule.isValid
                ? Icons.check_circle_rounded
                : Icons.radio_button_unchecked_rounded,
            size: 14,
            color: rule.isValid ? AppColors.primary : const Color(0xFFB7A591),
          ),
          const SizedBox(width: 6),
          Text(
            rule.label,
            style: TextStyle(
              fontSize: 11.5,
              color: rule.isValid ? AppColors.primary : const Color(0xFF8C7A66),
            ),
          ),
        ],
      ),
    );
  }
}
