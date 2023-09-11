import 'package:finaldemo/keka_project/splash/splash_screen.dart';
import 'package:finaldemo/screens/employee_screen/employee_screen_login/employee_Login_view.dart';
import 'package:finaldemo/screens/manager_screen/manager_leave/manager_leave_view.dart';
import 'package:flutter/material.dart';
import 'screens/main_screen/main_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        appBarTheme: const AppBarTheme(color: Colors.green, foregroundColor: Colors.white),
        useMaterial3: false,
      ),
      routes: routes,
      initialRoute: SplashScreenView.routeName,
    );
  }

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        SplashScreenView.routeName: SplashScreenView.builder,
        MainScreenView.routeName: MainScreenView.builder,
        EmployeeLoginView.routeName: EmployeeLoginView.builder,
        ManagerLeaveView.routeName: ManagerLeaveView.builder,
      };
}
