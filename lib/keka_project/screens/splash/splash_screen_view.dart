import 'dart:async';
import 'package:finaldemo/keka_project/screens/main_screen/main_screen_view.dart';
import 'package:finaldemo/keka_project/screens/splash/splash_screen_cubit.dart';
import 'package:finaldemo/keka_project/screens/splash/splash_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatefulWidget {
  static const String routeName = "Splash_Screen";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit(SplashScreenState()),
      child: SplashScreenView(),
    );
  }

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> with TickerProviderStateMixin {
  double fontSize = 2;
  double containerSize = 3;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController controller;
  Animation? animation1;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20)
        .animate(CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    controller.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        Navigator.of(context).pushReplacementNamed(MainScreenView.routeName);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 3000),
                  curve: Curves.easeInOutCubicEmphasized,
                  height: height / fontSize),
              AnimatedOpacity(
                duration: Duration(milliseconds: 2000),
                opacity: _textOpacity,
                child: Text(
                  'Here We Go!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1?.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.easeInOutBack,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.easeInOutBack,
                height: 300,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset("assets/images/keka.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
