import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final void Function()? onPressed;
  final double? minWidth;

  const CustomButton({super.key, this.child, this.onPressed, this.minWidth});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      color: Colors.green.shade200,
      child: child,
    );
  }
}

class CustomButtonChange extends StatelessWidget {
  final Widget? child;
  final void Function()? onPressed;
  final double? minWidth;
  final Color? color;
  final Color? textColor;

  const CustomButtonChange({super.key, this.child, this.onPressed, this.minWidth, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: textColor,
      onPressed: onPressed,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      color: color,
      child: child,
    );
  }
}
