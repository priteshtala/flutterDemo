import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SplashScreenState extends Equatable {
  @override
  List<Object?> get props => [fontSize, containerSize, textOpacity, containerOpacity, controller, animation1];

  double fontSize;
  double containerSize;

  double textOpacity;
  double containerOpacity;

  AnimationController? controller;
  Animation? animation1;

  SplashScreenState({
    this.fontSize = 2,
    this.containerSize = 7,
    this.textOpacity = 0.0,
    this.containerOpacity = 0.0,
    this.controller,
    this.animation1,
  });

  SplashScreenState copyWith({
    double? fontSize,
    double? containerSize,
    double? textOpacity,
    double? containerOpacity,
    AnimationController? controller,
    Animation<double>? animation1,
  }) {
    return SplashScreenState(
      fontSize: fontSize ?? this.fontSize,
      containerSize: containerSize ?? this.containerSize,
      textOpacity: textOpacity ?? this.textOpacity,
      containerOpacity: containerOpacity ?? this.containerOpacity,
      controller: controller ?? this.controller,
      animation1: animation1 ?? this.animation1,
    );
  }
}
