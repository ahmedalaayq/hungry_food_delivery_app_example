import 'package:flutter/material.dart';
import 'package:hungry/theme/app_colors.dart';

class CustomField extends StatefulWidget {
  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.isPassword = false,
    this.obscureText = false,
    this.autofillHints,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final FormFieldValidator<String>? validator;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final IconData? prefixIcon;

  final bool obscureText;
  final bool isPassword;

  final Iterable<String>? autofillHints;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: widget.controller,
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please enter ${widget.labelText.toLowerCase()}";
            }
            return null;
          },
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autofillHints: widget.autofillHints,
      obscureText: widget.isPassword ? _obscureText : false,
      autocorrect: false,
      enableSuggestions: !widget.isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade50,

        labelText: widget.labelText,
        hintText: widget.hintText,

        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(widget.prefixIcon, color: Colors.black54),

        suffixIcon: widget.isPassword
            ? IconButton(
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              )
            : null,

        labelStyle: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: Colors.black54),

        hintStyle: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: Colors.black38),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}
