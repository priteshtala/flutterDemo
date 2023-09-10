import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextForm extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? label;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool readOnly;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomTextForm(
      {super.key,
        this.hintText,
        this.prefixIcon,
        this.label,
        this.validator,
        this.controller,
        this.onTap,
        required this.readOnly,
        this.onChanged,
        this.inputFormatters,
        this.keyboardType,
        required this.textCapitalization,
        this.suffixIcon,
        required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
      child: Container(
        margin: const EdgeInsets.all(0.1),
        child: TextFormField(
          obscureText: obscureText,
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          onTap: onTap,
          readOnly: readOnly,
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.black,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(color: Colors.grey[600]),
            hintText: hintText,
            filled: true,
            fillColor: Colors.grey.withOpacity(0.3),
            label: label,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
