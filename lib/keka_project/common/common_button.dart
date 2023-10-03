import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

// customButton
class CustomButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  final double? minWidth;
  final Color? splashColor;

  const CustomButton({super.key, required this.child, required this.onPressed, this.minWidth, this.splashColor});

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: onPressed,
      color: Colors.green,
      child: child,
      shadowDegree: ShadowDegree.light,
      width: 300,
      height: 45,
    );
  }
}

class CustomButtonChange extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  final double width;
  final double height;
  final Color color;

  const CustomButtonChange({
    super.key,
    required this.child,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      color: color,
      onPressed: onPressed,
      child: child,
      width: width,
      height: height,
    );
  }
}
