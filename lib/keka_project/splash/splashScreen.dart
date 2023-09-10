import 'dart:async';

import 'package:finaldemo/keka_project/splash/splash_screen_cubit.dart';
import 'package:finaldemo/keka_project/splash/splash_screen_state.dart';
import 'package:finaldemo/screens/main_screen/main_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatefulWidget {
  static const String routeName = "Splash_Screen";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit(SplashScreenState()),
      child: const SplashScreenView(),
    );
  }

  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
       Navigator.of(context).pushReplacementNamed(MainScreenView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                "https://yt3.googleusercontent.com/k6Kwwm3mCkN_xqh3rDtHP9eCWDspjVLCILs6cbAwt1ypGNTn12AX98kiixw-ZLZMntag90jEv20=s900-c-k-c0x00ffffff-no-rj",
              ),
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
