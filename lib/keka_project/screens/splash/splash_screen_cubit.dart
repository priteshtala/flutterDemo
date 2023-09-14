import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finaldemo/keka_project/screens/main_screen/main_screen_view.dart';
import 'package:flutter/material.dart';

import 'splash_screen_state.dart';
import 'splash_screen_view.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit(super.initialState);

  void animation() {
    state.animation1 = Tween<double>(begin: 100, end: 30)
        .animate(CurvedAnimation(parent: kAlwaysCompleteAnimation, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        emit(state.copyWith(textOpacity: 1.0));
      });

    state.controller?.forward();

    Timer(Duration(seconds: 2), () {
      emit(state.copyWith(fontSize: 1.06));
    });

    Timer(Duration(seconds: 2), () {
      emit(state.copyWith(containerSize: 2, containerOpacity: 1));
    });
/////
    Timer(Duration(seconds: 4), () {

      // setState(() {
      //   Navigator.pushReplacement(context, PageTransition(MainScreenView()));
      // });
    });
  }

  void dispose() {
    state.controller?.dispose();
  }
}
