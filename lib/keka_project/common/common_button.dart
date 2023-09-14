import 'package:flutter/material.dart';

// customButton
class CustomButton extends StatelessWidget {
  final Widget? child;
  final void Function()? onPressed;
  final double? minWidth;
  final Color? splashColor;

  const CustomButton({super.key, this.child, this.onPressed, this.minWidth,this.splashColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      color: Colors.green,
      child: child,
      textColor: Colors.white,
      splashColor: splashColor,
    );
  }
}

class CustomButtonChange extends StatelessWidget {
  final Color? splashColor;
  final Widget? child;
  final void Function()? onPressed;
  final double? minWidth;
  final Color? color;
  final Color? textColor;

  const CustomButtonChange({super.key, this.child, this.onPressed, this.minWidth, this.color, this.textColor, this.splashColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: splashColor,
      textColor: textColor,
      onPressed: onPressed,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      color: color,
      child: child,
    );
  }
}
