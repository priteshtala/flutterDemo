import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? initialValue;

  const CustomSearch({super.key, this.controller, this.onTap, this.onChanged, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textInputAction: TextInputAction.next,
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.search_rounded),
        hintText: "Search",
        contentPadding: const EdgeInsets.only(left: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
        focusColor: Colors.green,
      ),
    );
  }
}
