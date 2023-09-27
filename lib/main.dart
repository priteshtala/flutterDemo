import 'package:flutter/material.dart';
import 'keka_project/screens/employee_screen/add_leave/add_leave_view.dart';
import 'keka_project/screens/employee_screen/employee_screen_login/employee_login_view.dart';
import 'keka_project/screens/main_screen/main_screen_view.dart';
import 'keka_project/screens/manager_screen/add_employee/add_employee_view.dart';
import 'keka_project/screens/manager_screen/department_details/department_details_view.dart';
import 'keka_project/screens/manager_screen/employee_details/employee_details_view.dart';
import 'keka_project/screens/manager_screen/manager_leave/manager_leave_view.dart';
import 'keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_view.dart';
import 'keka_project/screens/splash/splash_screen_view.dart';

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
        appBarTheme: AppBarTheme(
          centerTitle: false,
          toolbarHeight: 70,
          color: Colors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
          ),
        ),
        // useMaterial3: true,
      ),
      routes: routes,
      initialRoute: SplashScreenView.routeName,
      // home: MyCustomSplashScreen(),
    );
  }

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        SplashScreenView.routeName: SplashScreenView.builder,
        MainScreenView.routeName: MainScreenView.builder,
        EmployeeLoginView.routeName: EmployeeLoginView.builder,
        ManagerLeaveView.routeName: ManagerLeaveView.builder,
        EmployeeDetailsView.routeName: EmployeeDetailsView.builder,
        AddEmployeeView.routeName: AddEmployeeView.builder,
        DepartmentDetailsView.routeName: DepartmentDetailsView.builder,
        AddLeaveView.routeName: AddLeaveView.builder,
        ManagerLeaveRequest.routeName: ManagerLeaveRequest.builder,
      };
}
