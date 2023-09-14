// import 'dart:async';
//
// import 'package:finaldemo/keka_project/screens/main_screen/main_screen_view.dart';
// import 'package:finaldemo/keka_project/screens/splash/splash_screen_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'splash_screen_state.dart';
//
//
// classnView extends StatefulWidget {
//   static const String routeName = "Splash_Screen";
//
//   static Widget builder(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SplashScreenCubit(SplashScreenState()),
//       child: const SplashScreenView(),
//     );
//   }
//
//   const SplashScreenView({super.key});
//
//   @override
//   State<SplashScreenView> createState() => _SplashScreenViewState();
// }
//
// class _SplashScreenViewState extends State<SplashScreenView> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 4), () {
//       Navigator.of(context).pushReplacementNamed(MainScreenView.routeName);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height * 0.45,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             image: DecorationImage(
//               image: NetworkImage(
//                 "https://yt3.googleusercontent.com/k6Kwwm3mCkN_xqh3rDtHP9eCWDspjVLCILs6cbAwt1ypGNTn12AX98kiixw-ZLZMntag90jEv20=s900-c-k-c0x00ffffff-no-rj",
//               ),
//               repeat: ImageRepeat.noRepeat,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:finaldemo/keka_project/screens/main_screen/main_screen_view.dart';
// import 'package:finaldemo/keka_project/screens/splash/splash_screen_cubit.dart';
// import 'package:finaldemo/keka_project/screens/splash/splash_screen_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class SplashScreenView extends StatefulWidget {
//   static const String routeName = "Splash_Screen";
//
//   static Widget builder(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SplashScreenCubit(SplashScreenState()),
//       child: SplashScreenView(),
//     );
//   }
//
//   @override
//   _SplashScreenViewState createState() => _SplashScreenViewState();
// }
//
// class _SplashScreenViewState extends State<SplashScreenView> with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 4), () {
//       Navigator.of(context).pushReplacementNamed(MainScreenView.routeName);
//     });
//     context.read<SplashScreenCubit>().animation();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double _width = MediaQuery.of(context).size.width;
//     double _height = MediaQuery.of(context).size.height;
//
//     return BlocBuilder<SplashScreenCubit, SplashScreenState>(
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           body: Stack(
//             children: [
//               Column(
//                 children: [
//                   AnimatedContainer(
//                       duration: Duration(milliseconds: 2000),
//                       curve: Curves.fastLinearToSlowEaseIn,
//                       height: _height / state.fontSize),
//                   AnimatedOpacity(
//                     duration: Duration(milliseconds: 1000),
//                     opacity: state.textOpacity,
//                     child: Text(
//                       'Keka',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: state.animation1?.value,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Center(
//                 child: AnimatedOpacity(
//                   duration: Duration(milliseconds: 2000),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   opacity: state.containerOpacity,
//                   child: AnimatedContainer(
//                     duration: Duration(milliseconds: 2000),
//                     curve: Curves.fastLinearToSlowEaseIn,
//                     height: 200,
//                     width: 200,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Image.network(
//                         'https://yt3.googleusercontent.com/k6Kwwm3mCkN_xqh3rDtHP9eCWDspjVLCILs6cbAwt1ypGNTn12AX98kiixw-ZLZMntag90jEv20=s900-c-k-c0x00ffffff-no-rj'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class PageTransition extends PageRouteBuilder {
//   final Widget page;
//
//   PageTransition(this.page)
//       : super(
//           pageBuilder: (context, animation, anotherAnimation) => page,
//           transitionDuration: Duration(milliseconds: 2000),
//           transitionsBuilder: (context, animation, anotherAnimation, child) {
//             animation = CurvedAnimation(
//               curve: Curves.fastLinearToSlowEaseIn,
//               parent: animation,
//             );
//             return Align(
//               alignment: Alignment.bottomCenter,
//               child: SizeTransition(
//                 sizeFactor: animation,
//                 child: page,
//                 axisAlignment: 0,
//               ),
//             );
//           },
//         );
// }

import 'dart:async';
import 'package:finaldemo/keka_project/screens/main_screen/main_screen_view.dart';
import 'package:finaldemo/keka_project/screens/splash/splash_screen_cubit.dart';
import 'package:finaldemo/keka_project/screens/splash/splash_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatefulWidget {
  static const String routeName = "Splash_Screen";

//
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
  double containerSize = 1.5;
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: height / fontSize),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
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
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: width / containerSize,
                  width: width / containerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.network(
                      'https://yt3.googleusercontent.com/k6Kwwm3mCkN_xqh3rDtHP9eCWDspjVLCILs6cbAwt1ypGNTn12AX98kiixw-ZLZMntag90jEv20=s900-c-k-c0x00ffffff-no-rj')
//                 child: Text(
//                   'keka',
//                 ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
