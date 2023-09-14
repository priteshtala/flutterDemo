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
      height: 50,
    );
  }
}

class CustomButtonChange extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  final double width;
  final double height;
  final Color color;

  const CustomButtonChange(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.width, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(color: color,
      onPressed: onPressed,
      child: child,
      width: width,
      height: height,
    );
  }
}

//   animated_button: ^0.1.3

// import 'package:animated_button/animated_button.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyCustomWidget extends StatefulWidget {
// @override
// MyCustomWidgetState createState() => MyCustomWidgetState();
// }
//
// class _MyCustomWidgetState extends State<MyCustomWidget> {
// @override
// Widget build(BuildContext context) {
// return Scaffold(
// body: Center(
// child: AnimatedButton(
// child: Text(
// 'Simple button',
// style: TextStyle(
// fontSize: 22,
// color: Colors.white,
// fontWeight: FontWeight.w500,
// ),
// ),
// color: Colors.blue,
// onPressed: () {},
// enabled: true,
// shadowDegree: ShadowDegree.light,
// ),
// ),
// );
// }
// }
